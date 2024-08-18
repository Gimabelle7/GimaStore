//
//  User.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 8/8/24.
//

import Foundation

struct User {
    var uid: String
    var email: String
    var nombre: String?
    var apellido: String?
    var created: String?
    var password: String?
    
    init(uid: String, email: String, nombre: String? = "",  apellido: String? = "",  created: String? = "",  password: String? = "") {
        self.uid = uid
        self.email = email
        self.nombre = nombre
        self.apellido = apellido
        self.created = created
        self.password = password
    }
    
    var dictionary: [String: Any] {
        return [
            "uid": uid,
            "email": email,
            "nombre": nombre ?? "" ,
            "apellido": apellido ?? "" ,
            "created": created ?? "" ,
            "password": password ?? "" 
            
        ]
        
    }
}

