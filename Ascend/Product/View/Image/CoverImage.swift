//
//  CoverImage.swift
//  Ascend
//
//  Created by Mehmet  on 9.10.2023.
//

import SnapKit
import UIKit

class CoverImage: UIImageView {
    var heightConstraint: Constraint? = nil
    var coverImage: UIImage? {
        didSet {
            updateConstraint(image: coverImage)
        }
    }

    override init(image: UIImage? = nil) {
        super.init(frame: .zero)
        config()
        updateConstraint(image: image)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(image == nil)
    }

    private func roundCorners(_ shouldScaleLow: Bool) {
        layer.cornerRadius = shouldScaleLow ? CornerRadiuses.xLow.rawValue : CornerRadiuses.standart.rawValue
    }

    func setImage(image: UIImage?) {
        guard image != nil else { return }
        coverImage = image
        super.image = image
    }

    private func updateConstraint(image: UIImage?) {
        if image == nil {
            heightConstraint?.deactivate()
            snp.makeConstraints { make in
                heightConstraint = make.height.equalTo(20).constraint
            }
        } else {
            heightConstraint?.deactivate()
            snp.makeConstraints { make in
                heightConstraint = make.height.equalTo(200).constraint
            }
        }
    }

    private func config() {
        clipsToBounds = true
        backgroundColor = .secondaryLabel
        coverImage = image
        super.image = coverImage
    }
}
