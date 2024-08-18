//
//  RegisterVM.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 13/8/24.
//

import Foundation
import UIKit

class RegisterVM {
    
    private let authService = AuthService()
    
    var vc : UIViewController
    init(vc_:UIViewController) {
        vc = vc_
    }
    
    
    func signUp(user:Users,vc:UIViewController, completion: @escaping (Users?,Bool) -> Void){
        authService.createUser(user: user, vc: vc, completion: completion)
    }
    
    func validateForm(txtEmail: String?,txtName:String?,txtLastName:String?,password:String?) ->Bool {
        guard let email = txtEmail?.trimmingCharacters(in: .whitespacesAndNewlines), !email.isEmpty else {
            AlertHelper.show(titulo: "Error", mensaje: "El campo de email está vacío.", en: vc)
            return false
        }
        
        if !EmailValidator.isValid(email: email) {
            AlertHelper.show(titulo: "Error", mensaje:"El formato del email no es válido.", en: vc)
            return false
        }
        
        guard let name = txtName?.trimmingCharacters(in: .whitespacesAndNewlines), !name.isEmpty else {
            AlertHelper.show(titulo: "Error", mensaje: "El campo de nombre está vacío.", en: vc)
            return false
        }
        
        guard let lastName = txtLastName?.trimmingCharacters(in: .whitespacesAndNewlines), !lastName.isEmpty else {
            AlertHelper.show(titulo: "Error", mensaje: "El campo de apellido está vacío.", en: vc)
            return false
        }
        
        guard let password = password?.trimmingCharacters(in: .whitespacesAndNewlines), !password.isEmpty else {
            AlertHelper.show(titulo: "Error", mensaje: "El campo de contraseña está vacío.", en: vc)
            return false
        }
        

        return true
    }
    
}
