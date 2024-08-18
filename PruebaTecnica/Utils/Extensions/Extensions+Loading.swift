//
//  Extensions+Loading.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 13/8/24.
//

import Foundation
import UIKit

extension UIViewController {
    private struct AssociatedKeys {
        static var loadingView = "loadingView"
    }

    private var loadingView: UIView? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.loadingView) as? UIView
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.loadingView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func showLoad() {
        if loadingView == nil {
            // Crear vista de carga
            let loadingView = UIView(frame: view.bounds)
            loadingView.backgroundColor = UIColor.black.withAlphaComponent(0.5) // Fondo semitransparente
            loadingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

            // Crear indicador de carga
            let activityIndicator = UIActivityIndicatorView(style: .large)
            activityIndicator.color = .white
            activityIndicator.translatesAutoresizingMaskIntoConstraints = false
            loadingView.addSubview(activityIndicator)

            // Configurar constraints del indicador
            NSLayoutConstraint.activate([
                activityIndicator.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor),
                activityIndicator.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor)
            ])

            activityIndicator.startAnimating()

            view.addSubview(loadingView)
            self.loadingView = loadingView
        }
    }
    
    func hideLoad() {
        loadingView?.removeFromSuperview()
        loadingView = nil
    }
}
