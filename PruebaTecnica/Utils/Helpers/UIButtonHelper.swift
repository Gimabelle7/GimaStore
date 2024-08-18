//
//  UIButtonHelper.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 16/8/24.
//

import Foundation
import UIKit

class UIButtonHelper {
    
    static func createBarButton(title: String, icon: UIImage?, target: Any?, action: Selector) -> UIBarButtonItem {
        // Create the button with the icon (if provided)
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        if let iconImage = icon {
            button.setImage(iconImage, for: .normal)
        }
        button.addTarget(target, action: action, for: .touchUpInside)
        
        // Customize button's appearance
        button.tintColor = .systemBlue // Adjust color if needed
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16) // Adjust font size
        
        // Create UIBarButtonItem from UIButton
        let barButtonItem = UIBarButtonItem(customView: button)
        
        return barButtonItem
    }
}
