//
//  OnboardingView.swift
//  Ascend
//
//  Created by Mehmet  on 25.09.2023.
//

import Foundation
import UIKit

protocol OnboardingDelegate : AnyObject{
    func onGetStartedTapped()
}

class OnboardingView : BaseView {
    
    private let delegate : OnboardingDelegate
    
    private let illustration  = UIImageView(image: UIImage(resource: .icIllustration))
    
    private let notes = ProductText(value: StringKeys.Onboarding.daily.rawValue,textFont: .extraLargeTitle)
    
    private let desc = ProductText(value: StringKeys.Onboarding.desc.rawValue,foregroundColor: .secondaryLabel)
    
    private lazy var startButton = ActiveButtonCapsule(
        text: StringKeys.Buttons.getStarted,
        onPressed: delegate.onGetStartedTapped
    )
    private lazy var stack = UIStackView(arrangedSubviews: [illustration,notes,desc,startButton])
    

    
    init(delegate: OnboardingDelegate) {
        self.delegate = delegate
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setUp() {
        illustration.contentMode = .scaleAspectFit
        addSubview(stack)
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = Spacings.high.rawValue
    }
    
    override func layout() {
        stack.snp.makeConstraints { make in
            make.center.equalTo(self)
            make.width.equalTo(self)
        }

    }
}


@available(iOS 17.0, *)
#Preview(traits: .defaultLayout, body: {
    OnboardingView(delegate: OnboardingViewController())
})
