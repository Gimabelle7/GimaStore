//
//  Users.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 8/8/24.
//

import Foundation
import FirebaseFirestore

struct Users : Codable{
    var email,
        password,
        uid,
        name,
        lastName,
        createdUser,
        updateUser,
        updatePassword,
        displayName,
        birthDate,
        phoneNumber
    : String?
}
