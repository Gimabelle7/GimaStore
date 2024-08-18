//
//  Extensions+Strings.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 9/8/24.
//

import Foundation
import UIKit

extension String {
    // Verifica si la cadena no está vacía.
    func isNotEmpty() -> Bool {
        return !self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    //verifica si el email es valido
    func isValidEmail() -> Bool {
        return EmailValidator.isValid(email: self)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        return ceil(boundingBox.width)
    }
    
    func firstLetter() -> String? {
        return self.first.map { String($0) }?.uppercased()
    }
    
}
