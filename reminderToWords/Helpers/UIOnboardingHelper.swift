//
//  UIOnboardingHelper.swift
//  reminderToWords
//
//  Created by Ahmet Göktürk Kurt on 24.10.2023.
//

import UIKit
import UIOnboarding

struct UIOnboardingHelper {
    static func setUpIcon() -> UIImage {
        return Bundle.main.appIcon ?? .init(named: "onboarding-icon")!
    }
    
    // First Title Line
    // Welcome Text
    static func setUpFirstTitleLine() -> NSMutableAttributedString {
        .init(string: "Welcome to", attributes: [.foregroundColor: UIColor.label])
    }
    
    // Second Title Line
    // App Name
    static func setUpSecondTitleLine() -> NSMutableAttributedString {
        .init(string: Bundle.main.displayName ?? "Reminder To Words", attributes: [
            .foregroundColor: UIColor.init(named: "camou") ?? UIColor.init(red: 0.654, green: 0.618, blue: 0.494, alpha: 1.0)
        ])
    }

    static func setUpFeatures() -> Array<UIOnboardingFeature> {
        return .init([
            .init(icon: .init(named: "feature-1")!,
                  title: "Words",
                  description: "Create and save your words."),
            .init(icon: .init(named: "feature-2")!,
                  title: "App",
                  description: "Just open the app and practice the best you can"),
            .init(icon: .init(named: "feature-3")!,
                  title: "Reminder",
                  description: "The words you create will remain saved in the application, so look at them again every time you enter them. If you wish, create a reminder and see it automatically.")
        ])
    }
    
    static func setUpNotice() -> UIOnboardingTextViewConfiguration {
        return .init(icon: .init(named: "onboarding-notice-icon"),
                     text: "Developed and designed for members of the AGK.",
                     tint: .init(named: "camou") ?? .init(red: 0.654, green: 0.618, blue: 0.494, alpha: 1.0))
    }
    
    static func setUpButton() -> UIOnboardingButtonConfiguration {
        let button = UIOnboardingButtonConfiguration(title: "Continue", backgroundColor: .init(named: "camou") ?? .init(red: 0.654, green: 0.618, blue: 0.494, alpha: 1.0))
        return button
    }
}

extension UIOnboardingViewConfiguration {
    static func setUp() -> UIOnboardingViewConfiguration {
        return .init(appIcon: UIOnboardingHelper.setUpIcon(),
                     firstTitleLine: UIOnboardingHelper.setUpFirstTitleLine(),
                     secondTitleLine: UIOnboardingHelper.setUpSecondTitleLine(),
                     features: UIOnboardingHelper.setUpFeatures(),
                     textViewConfiguration: UIOnboardingHelper.setUpNotice(),
                     buttonConfiguration: UIOnboardingHelper.setUpButton())
    }
}
