//
//  Extensions+UIView.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 14/8/24.
//

import Foundation
import UIKit

extension UIView {
    func applyCorner(cornerRadius: CGFloat,background:UIColor = .white, shadowColor: UIColor = .black, shadowOpacity: Float = 0.5, shadowOffset: CGSize = CGSize(width: 0, height: 2), shadowRadius: CGFloat = 4) {
        // Aplica el corner radius
        self.layer.backgroundColor = background.cgColor
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = false

        // Aplica la sombra
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowRadius = shadowRadius
    }
    
    func applyCircle(background:UIColor = .white,borderColor: UIColor = .white, borderWidth: CGFloat = 2.0, shadowColor: UIColor = .black, shadowOpacity: Float = 0.5, shadowOffset: CGSize = CGSize(width: 0, height: 2), shadowRadius: CGFloat = 4) {
        let diameter = min(self.frame.size.width, self.frame.size.height)
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.backgroundColor = background.cgColor
        self.layer.cornerRadius = diameter / 2
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowRadius = shadowRadius
        self.clipsToBounds = true
    }
    
    func applyTopShadow(shadowColor: UIColor = .black, shadowOpacity: Float = 0.5, shadowRadius: CGFloat = 4, shadowOffset: CGSize = CGSize(width: 0, height: -2)) {
            self.layer.masksToBounds = false
            self.layer.shadowColor = shadowColor.cgColor
            self.layer.shadowOpacity = shadowOpacity
            self.layer.shadowRadius = shadowRadius
            self.layer.shadowOffset = shadowOffset
            
            // Crear un path para la sombra solo en la parte superior
            let shadowPath = UIBezierPath()
            shadowPath.move(to: CGPoint(x: 0, y: 0))
            shadowPath.addLine(to: CGPoint(x: self.bounds.width, y: 0))
            shadowPath.addLine(to: CGPoint(x: self.bounds.width, y: shadowRadius))
            shadowPath.addLine(to: CGPoint(x: 0, y: shadowRadius))
            shadowPath.close()

            self.layer.shadowPath = shadowPath.cgPath
        }
}
