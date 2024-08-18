//
//  UiLabelHelper.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 10/8/24.
//

import Foundation
import UIKit


class UiLabelHelper {
  static  func twoText(text1: String, color1: UIColor, text2: String, color2: UIColor) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: text1, attributes: [NSAttributedString.Key.foregroundColor: color1])
        let secondPart = NSAttributedString(string: text2, attributes: [NSAttributedString.Key.foregroundColor: color2])
        attributedText.append(secondPart)
        return attributedText
    }
}
