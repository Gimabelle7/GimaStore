//
//  Extensions+UITextField.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 13/8/24.
//

import Foundation
import UIKit

extension UITextField {

    enum FieldType {
        case text
        case email
        case password
        case number
    }

    func configure(for type: FieldType = .text, placeholder: String, textColor: UIColor = .purple) {
        self.placeholder = placeholder
        self.textColor = textColor

        // Personalizar el placeholder
        self.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: textColor.withAlphaComponent(0.4)]
        )

        // Quitar borde
        self.borderStyle = .none

        // Añadir línea debajo del UITextField
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.height - 1, width: self.frame.width, height: 1)
        bottomLine.backgroundColor = textColor.cgColor
        self.layer.addSublayer(bottomLine)

        // Configurar según el tipo
        switch type {
        case .text:
            self.isSecureTextEntry = false
            self.keyboardType = .default
        case .email:
            self.isSecureTextEntry = false
            self.keyboardType = .emailAddress
            self.autocapitalizationType = .none
        case .password:
            self.isSecureTextEntry = true
            self.keyboardType = .default
            self.autocapitalizationType = .none
        case .number:
            self.isSecureTextEntry = false
            self.keyboardType = .namePhonePad
            self.autocapitalizationType = .none
        }
    }
}
