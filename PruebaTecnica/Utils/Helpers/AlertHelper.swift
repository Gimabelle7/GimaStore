//
//  AlertHelper.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 8/8/24.

import Foundation
import UIKit

class AlertHelper {
    static func show(titulo: String, mensaje: String,btnAccept:String = "OK", en vc: UIViewController, onClick: (() -> Void)? = nil,   showCancel: Bool = false,onCancel: (() -> Void)? = nil ) {
        let alerta = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        let accionOK = UIAlertAction(title: btnAccept, style: .default) { _ in
              onClick?() // Ejecuta el bloque de código si no es nil
          }
        alerta.addAction(accionOK)
        if showCancel {
            let accionCancel = UIAlertAction(title: "Cancelar", style: .cancel) { _ in
                onCancel?() // Ejecuta el bloque de código si no es nil
            }
            alerta.addAction(accionCancel)
        }
        vc.present(alerta, animated: true, completion: nil)
    }
}
