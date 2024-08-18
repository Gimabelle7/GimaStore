//
//  EmailValidator.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 8/8/24.
//

import Foundation

struct EmailValidator {
    static func isValid(email: String) -> Bool {
        // Regex para validar correo electrónico
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.[A-Z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES[c] %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
}
