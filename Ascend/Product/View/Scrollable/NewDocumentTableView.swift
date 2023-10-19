//
//  NewDocumentTableView.swift
//  Ascend
//
//  Created by Mehmet  on 5.10.2023.
//

import Photos
import PhotosUI
import UIKit

protocol NewDocumentTableViewDelegate: AnyObject {
    func didPickImage(_ image: UIImage)
    func didPickSound()
}

class NewDocumentTableView: KeyboardSensitiveTableView {
    let toolbar: KeyboardAccessory
    weak var navigationController: UINavigationController?
    weak var customDelegate: NewDocumentTableViewDelegate?
    private var cells: [TableCells] = [
        TableCells.description,
    ]

    init(toolbar: KeyboardAccessory) {
        self.toolbar = toolbar
        super.init()
        toolbar.actionDelegate = self
        TableCells.checkBoxRow.register(self, Nibs.checkBoxRowCell)
        TableCells.description.register(self, Nibs.descriptionCell)
        self.delegate = self
        self.dataSource = self
        self.backgroundColor = .clear
        self.keyboardDismissMode = .onDrag
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NewDocumentTableView: UITableViewDelegate {}

extension NewDocumentTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cells.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = cells[indexPath.row]
        let cell = item.deque(tableView, indexPath: indexPath)
        cell.configure(toolbar)
        cell.tag = indexPath.row
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

extension NewDocumentTableView: KeyboardAccessoryProtocol {
    func onTapMic() {}

    func onTapGallery() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.mediaTypes = [UTType.image.identifier]
        vc.delegate = self
        navigationController?.present(vc, animated: true)
    }

    func onTapCalendar() {}

    func onTapCheckbox() {
        cells.append(.checkBoxRow)
        reloadData()
    }
}

extension NewDocumentTableView: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }

    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
    ) {
        guard let pickedImage = info[.originalImage] as? UIImage else {
            return
        }
        customDelegate?.didPickImage(pickedImage)
        picker.dismiss(animated: true)
    }
}
