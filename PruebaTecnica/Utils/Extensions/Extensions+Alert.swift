//
//  Extensions+Alert.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 9/8/24.
//

import Foundation
import UIKit


extension UIViewController {
    func showAlert(titulo: String, mensaje: String) {
        let alerta = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        let accion = UIAlertAction(title: "OK", style: .default, handler: nil)
        alerta.addAction(accion)
        self.present(alerta, animated: true, completion: nil)
    }
}
