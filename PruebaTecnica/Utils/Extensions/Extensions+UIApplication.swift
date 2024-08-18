//
//  Extensions+UIApplication.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 14/8/24.
//

import Foundation
import UIKit

extension UIApplication {
    static func openURLInBrowser(urlString: String,completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: urlString) else {
            print("URL inválida: \(urlString)")
            return
        }

        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: { success in
                if success {
                    print("URL abierta exitosamente: \(urlString)")
                    completion(false)
                    return
                }
                print("No se pudo abrir la URL: \(urlString)")
                completion(true)
                
            })
        } else {
            print("No se puede abrir la URL: \(urlString)")
            completion(true)
        }
    }
}
