//
//  NewDocumentView.swift
//  Ascend
//
//  Created by Mehmet  on 1.10.2023.
//

import Foundation
import UIKit

class NewDocumentView: BaseView {
    private let headerView = NewDocumentHeaderView()
    private let toolBar = Nibs.keyboardAccessory.fromNib(type: KeyboardAccessory.self)
    private lazy var tableView = NewDocumentTableView(toolbar: toolBar)
    private let coverImage = CoverImage()

    override func setUp() {
        setUpHeader()
        setupImageView()
        setupTableView()
    }

    override func layout() {
        layoutHeader()
        layoutCoverImage()
        layoutScrollView()
    }

    override var alignmentRectInsets: UIEdgeInsets {
        Paddings.vertical.standart + Paddings.horizontal.standart
    }
}

@available(iOS 17.0, *)
#Preview(traits: .defaultLayout, body: {
    UINavigationController(rootViewController: NewDocumentViewController())
})

// MARK: Setup

private extension NewDocumentView {
    private func setUpHeader() {
        addSubview(headerView)
    }

    private func setupTableView() {
        addSubview(tableView)
        tableView.navigationController = navigationController
        tableView.customDelegate = self
        TableCells.description.register(tableView, Nibs.descriptionCell)
        TableCells.checkBoxRow.register(tableView, Nibs.checkBoxRowCell)
    }

    private func setupImageView() {
        addSubview(coverImage)
        coverImage.contentMode = .scaleAspectFill
    }
}

// MARK: Layout

private extension NewDocumentView {
    func layoutHeader() {
        headerView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }

    func layoutCoverImage() {
        coverImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(headerView.snp.bottom).inset(-Spacings.standart.rawValue)
            make.width.equalToSuperview()
        }
    }

    func layoutScrollView() {
        tableView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(coverImage.snp.bottom).inset(-Spacings.xLow.rawValue)
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
}

extension NewDocumentView: NewDocumentTableViewDelegate {
    func didPickImage(_ image: UIImage) {
        coverImage.setImage(image: image)
    }

    func didPickSound() {}
}
