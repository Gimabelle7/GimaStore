//
//  Extensions+UIButton.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 13/8/24.
//

import Foundation

import UIKit
import ObjectiveC

extension UIButton {
    
    private struct AssociatedKeys {
           static var activityIndicator = "activityIndicator"
           static var originalTitle = "originalTitle"
       }
       
       private var activityIndicator: UIActivityIndicatorView? {
           get {
               return objc_getAssociatedObject(self, &AssociatedKeys.activityIndicator) as? UIActivityIndicatorView
           }
           set {
               objc_setAssociatedObject(self, &AssociatedKeys.activityIndicator, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
           }
       }
       
       private var originalTitle: String? {
           get {
               return objc_getAssociatedObject(self, &AssociatedKeys.originalTitle) as? String
           }
           set {
               objc_setAssociatedObject(self, &AssociatedKeys.originalTitle, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
           }
       }
       
       func showLoading() {
           if activityIndicator == nil {
               let indicator = UIActivityIndicatorView(style: .medium)
               indicator.color = .white
               indicator.translatesAutoresizingMaskIntoConstraints = false
               addSubview(indicator)
               NSLayoutConstraint.activate([
                   indicator.centerXAnchor.constraint(equalTo: centerXAnchor),
                   indicator.centerYAnchor.constraint(equalTo: centerYAnchor)
               ])
               activityIndicator = indicator
           }
           
           if originalTitle == nil {
               originalTitle = title(for: .normal)
           }
           
           activityIndicator?.startAnimating()
           isEnabled = false
           setTitle("", for: .normal)
       }
       
       func hideLoading() {
           activityIndicator?.stopAnimating()
           isEnabled = true
           
           if let title = originalTitle {
               setTitle(title, for: .normal)
           }
       }
    
    func applyStyle(withTitle title: String, backgroundColor: UIColor, titleColor: UIColor = .white) {
        // Redondear las esquinas
        self.layer.cornerRadius = self.frame.height / 2
        
        // Establecer el color de fondo
        self.backgroundColor = backgroundColor
        
        // Establecer el título del botón
        self.setTitle(title, for: .normal)
        
        // Establecer el color del texto
        self.setTitleColor(titleColor, for: .normal)
        
        // Establecer la fuente y el tamaño del texto
        self.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    }
    func setCustomStyle(backgroundColor: UIColor, titleColor: UIColor, cornerRadius: CGFloat, title: String, isBold: Bool = false, fontSize: CGFloat) {
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.setTitleColor(titleColor, for: .normal)
        self.setTitle(title, for: .normal)
        
        // Configurar el estilo de fuente
        let font: UIFont
        if isBold {
            font = UIFont.boldSystemFont(ofSize: fontSize)
        } else {
            font = UIFont.systemFont(ofSize: fontSize)
        }
        self.titleLabel?.font = font
    }
}
