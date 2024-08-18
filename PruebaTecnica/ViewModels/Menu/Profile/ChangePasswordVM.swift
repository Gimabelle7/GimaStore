//
//  ChangePasswordVM.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 14/8/24.
//

import Foundation
import UIKit

class ChangePasswordVM{
    private let authService = AuthService()
    
    var vc : UIViewController
    init(vc_:UIViewController) {
        vc = vc_
    }
    
    
    func updatePassword(password:String,vc:UIViewController, completion: @escaping (Bool) -> Void){
        authService.updatePassword(newPassword: password, vc: vc, completion: completion)
    }
    
    func validateForm(oldPassword: String?,newPassword:String?) ->Bool {
        if let user_:Users = GlobalStorage.shared.get(forKey: StorageConstant.userData, as: Users.self) {
            guard let oldPassword = oldPassword?.trimmingCharacters(in: .whitespacesAndNewlines), !oldPassword.isEmpty else {
                AlertHelper.show(titulo: "Error", mensaje: "El campo Anterior contraseña está vacío.", en: vc)
                return false
            }
            let pass = user_.password ?? ""
            if pass != oldPassword{
                AlertHelper.show(titulo: "Error", mensaje: "La contraseña ingresada no coincide con la anterior.", en: vc)
                return false
            }
            
            guard let newPassword = newPassword?.trimmingCharacters(in: .whitespacesAndNewlines), !newPassword.isEmpty else {
                AlertHelper.show(titulo: "Error", mensaje: "El campo de Nueva contraseña está vacío.", en: vc)
                return false
            }
        }
        return true
    }
    
}
