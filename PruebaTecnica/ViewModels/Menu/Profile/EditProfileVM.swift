//
//  EditProfileVM.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 14/8/24.
//

import Foundation
import UIKit

class EditProfileVM{
    
    private let authfirestore = AuthFirestore()
    
    var vc : UIViewController
    init(vc_:UIViewController) {
        vc = vc_
    }
    
    
    func updateDate(user:Users,vc:UIViewController, completion: @escaping (Users?,Bool) -> Void){
        authfirestore.updateData(user: user, vc: vc, completion: completion)
    }
    
    func validateForm(user: Users) ->Bool {
        guard let name = user.name?.trimmingCharacters(in: .whitespacesAndNewlines), !name.isEmpty else {
            AlertHelper.show(titulo: "Error", mensaje: "El campo de Nombre está vacío.", en: vc)
            return false
        }
        
        
        guard let lastName = user.lastName?.trimmingCharacters(in: .whitespacesAndNewlines), !lastName.isEmpty else {
            AlertHelper.show(titulo: "Error", mensaje: "El campo de Apellido está vacío.", en: vc)
            return false
        }
        
        guard let birthDate = user.birthDate?.trimmingCharacters(in: .whitespacesAndNewlines), !birthDate.isEmpty else {
            AlertHelper.show(titulo: "Error", mensaje: "El campo de Fecha de Nacimiento está vacío.", en: vc)
            return false
        }
        
        guard let phoneNumber = user.phoneNumber?.trimmingCharacters(in: .whitespacesAndNewlines), !phoneNumber.isEmpty else {
            AlertHelper.show(titulo: "Error", mensaje: "El campo de Número de teléfono está vacío.", en: vc)
            return false
        }
        return true
    }
    
}
