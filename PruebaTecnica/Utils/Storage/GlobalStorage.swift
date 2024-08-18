//
//  GlobalStorage.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 8/8/24.

import Foundation
import UIKit

class GlobalStorage {
    static let shared = GlobalStorage()

       private let defaults = UserDefaults.standard

       private init() {}

       // Función genérica para guardar datos
       func save<T>(_ value: T, forKey key: String) where T: Codable {
           let encoder = JSONEncoder()
           if let encoded = try? encoder.encode(value) {
               defaults.set(encoded, forKey: key)
           } else {
               print("Failed to encode and save data for key \(key)")
           }
       }

       // Función genérica para obtener datos
       func get<T>(forKey key: String, as type: T.Type) -> T? where T: Codable {
           if let savedData = defaults.object(forKey: key) as? Data {
               let decoder = JSONDecoder()
               if let decodedObject = try? decoder.decode(type, from: savedData) {
                   return decodedObject
               } else {
                   print("Failed to decode data for key \(key)")
               }
           }
           return nil
       }

       // Función para eliminar un dato guardado
       func remove(forKey key: String) {
           defaults.removeObject(forKey: key)
       }
    
    func signOut(vc:UIViewController){
        GlobalStorage.shared.remove(forKey: StorageConstant.isLogeed)
        GlobalStorage.shared.remove(forKey: StorageConstant.userData)
        NavigationHelper.presentScreen(on: vc, withIdentifier: IdVcConstant.login)
    }

}
