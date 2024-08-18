//
//  StringHelper.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 17/8/24.
//

import Foundation

class StringHelper{
    static func formatPrice(_ price: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: price)) ?? "\(price)"
    }
}
