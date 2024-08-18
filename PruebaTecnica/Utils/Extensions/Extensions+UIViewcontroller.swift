//
//  Extensions+UIViewcontroller.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 14/8/24.
//

import Foundation

import UIKit


private var onDismissKey: UInt8 = 0

extension UIViewController {
    var onDismiss: (() -> Void)? {
        get {
            return objc_getAssociatedObject(self, &onDismissKey) as? (() -> Void)
        }
        set {
            objc_setAssociatedObject(self, &onDismissKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    // Método para llamar manualmente al closure onDismiss
    func callOnDismiss() {
        onDismiss?()
    }
}
