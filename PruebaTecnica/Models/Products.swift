//
//  Products.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 13/8/24.
//

import Foundation

enum ProveedorDB: String, Codable {
    case firebase = "FIREBASE"
    case fakeApi = "FAKE_API"
}

struct Products:Codable{
    var id:Int?
    var UID,
        idProduct,
        title,
        category,
        description,
        image,
        proveedorDB,
        create,
        updated
        : String?
    var price : Double?
    var rating : Rating?
    var like : Bool? = false
    
}


struct Rating:Codable{
    var rate: Double? = 0
    var count: Int? = 0
    
}

struct ItemConfig{
    var product:Products!
    var categories:[String]
}
