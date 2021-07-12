//
//  Color+Extesnion.swift
//  SimpleBookApp
//
//  Created by Nana Jimsheleishvili on 12.07.21.
//

import UIKit

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}
