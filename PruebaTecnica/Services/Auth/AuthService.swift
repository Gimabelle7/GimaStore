//
//  AuthService.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 12/8/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthService {
    private let fbService = AuthFirestore()
    private let auth = Auth.auth()
    
    func signIn(email: String, password: String,vc:UIViewController, completion: @escaping (Users?, Bool) -> Void) {
        auth.signIn(withEmail: email, password: password, completion: { authResult, error in
            if let error = error {
                let msg = UserValidations.errorSignInMsg(errors: error)
                AlertHelper.show(titulo: "Error", mensaje: msg, en: vc)
                completion(nil,true)
                return
            } else if let authResult = authResult {
                self.fbService.fetchUserData(uid: authResult.user.uid, vc: vc) { user, success in
                    completion(user,success)
                }
            }
        })
    }
    
    func createUser(user:Users,vc:UIViewController, completion: @escaping (Users?, Bool) -> Void) {
        auth.createUser(withEmail: user.email ?? "", password: user.password ?? "", completion: { authResult, error in
            if let error = error as NSError?{
                let msg = UserValidations.errorSignUpMsg(errors: error)
                AlertHelper.show(titulo: "Error", mensaje: msg, en: vc)
                completion(nil,true)
            } else if let authResult = authResult {
                var user_ = user
                user_.uid = authResult.user.uid
                user_.createdUser = "\(DateHelper.getCurrentDateString())"
                self.fbService.saveUserData(user: user_,vc: vc) { isCreate in
                    if isCreate ?? false{
                        self.fbService.fetchUserData(uid: user_.uid ?? "", vc: vc) { user, success in
                            completion(user,success)
                        }
                    }
                }
            }
        })
    }
    
    func updateProfile(displayName: String?,vc:UIViewController, completion: @escaping (Error?) -> Void) {
        if let user = auth.currentUser {
            let changeRequest = user.createProfileChangeRequest()
            changeRequest.displayName = displayName
            changeRequest.commitChanges { error in
                completion(error)
            }
        }
    }
    
    func updatePassword(newPassword: String, vc:UIViewController, completion: @escaping (Bool) -> Void) {
        guard let user = Auth.auth().currentUser else {
            AlertHelper.show(titulo: "Error", mensaje: "Error al obtener las credenciales", en: vc)
            return
        }
        
        user.updatePassword(to: newPassword) { error in
            if let error = error {
                let msg = UserValidations.errorSignUpMsg(errors: error)
                AlertHelper.show(titulo: "Error", mensaje: msg, en: vc)
                completion(true)
               return
            }
            let user = Users(password: newPassword,updatePassword: "\(DateHelper.getCurrentDateString())")
            self.fbService.updateData(user: user, vc: vc) { users_, success in
                completion(success)
            }
            
        }
    }
}
