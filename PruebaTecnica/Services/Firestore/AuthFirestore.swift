//
//  AuthFirestore.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 12/8/24.
//

import FirebaseFirestore
import Foundation



class AuthFirestore{
    private let db = Firestore.firestore()
    
    func saveUserData(user: Users,vc: UIViewController, completion: @escaping (Bool?) -> Void) {
        db.collection(FireConstant.usersColl).document(user.uid ?? "").setData(toJSON(user)) { error in
            if let error = error {
                let msg = UserValidations.errorFirestoreMsg(errors: error)
                AlertHelper.show(titulo: "Error", mensaje: msg, en: vc)
               return
            }
            completion(true)
        }
    }
        
    func fetchUserData(uid: String,vc: UIViewController, completion: @escaping (Users?, Bool) -> Void) {
            db.collection(FireConstant.usersColl).document(uid).getDocument { snaps, error in
                if let error = error {
                    let msg = UserValidations.errorFirestoreMsg(errors: error)
                    AlertHelper.show(titulo: "Error", mensaje: msg, en: vc)
                   return
                }
                guard let document = snaps, document.exists,
                       let data = document.data() else {
                    AlertHelper.show(titulo: "Error", mensaje: "El documento no existe o los datos están vacíos.", en: vc)
                     return
                }
                if let user_ = decodeObject(data, tipo: Users.self, convertirData: { jsonObject in
                     return try JSONSerialization.data(withJSONObject: jsonObject, options: [])
                 }) {
                    GlobalStorage.shared.save(true, forKey: StorageConstant.isLogeed)
                    GlobalStorage.shared.save(user_, forKey: StorageConstant.userData)
                     completion(user_, false)
                 } else {
                     AlertHelper.show(titulo: "Error", mensaje: "Error al decodificar los datos.", en: vc)
                     completion(nil,true)
                 }
            }
        }
    
    func updateData(user:Users ,vc: UIViewController,reload:Bool = true, completion: @escaping (Users?, Bool) -> Void){
        if let user_:Users = GlobalStorage.shared.get(forKey: StorageConstant.userData, as: Users.self) {
            let userRef = db.collection(FireConstant.usersColl).document(user_.uid ?? "")
            var userU = user
            userU.updateUser =  "\(DateHelper.getCurrentDateString())"
            userRef.updateData(userU.toDictionary()) { error in
                if let error = error {
                    let msg = UserValidations.errorFirestoreMsg(errors: error)
                    AlertHelper.show(titulo: "Error", mensaje: msg, en: vc)
                   return
                }
                if reload{
                    self.fetchUserData(uid: user_.uid ?? "", vc: vc) { user, success in
                        completion(user,success)
                    }
                }else{
                    completion(nil,false)
                }
             
            }

        }
    }
}
