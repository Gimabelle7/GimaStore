//
//  LoginVM.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 8/8/24.
//
import Foundation
import FirebaseAuth
import FirebaseFirestore

class LoginVM {
    
    var vc : UIViewController
    init(vc_:UIViewController) {
        vc = vc_
    }
    
    private let authService = AuthService()
    
    func signIn(email:String, password:String,vc:UIViewController, completion: @escaping (Users?,Bool) -> Void){
        authService.signIn(email: email, password: password,vc: vc,completion: completion)
    }
    
    func validateForm(txtEmail: String?,password:String?) ->Bool {
        guard let email = txtEmail?.trimmingCharacters(in: .whitespacesAndNewlines), !email.isEmpty else {
            AlertHelper.show(titulo: "Error", mensaje: "El campo de email está vacío.", en: vc)
            return false
        }
        
        guard let password = password?.trimmingCharacters(in: .whitespacesAndNewlines), !password.isEmpty else {
            AlertHelper.show(titulo: "Error", mensaje: "El campo de contraseña está vacío.", en: vc)
            return false
        }
        
        if !EmailValidator.isValid(email: email) {
            AlertHelper.show(titulo: "Error", mensaje:"El formato del email no es válido.", en: vc)
            return false
        }
        return true
    }
}
