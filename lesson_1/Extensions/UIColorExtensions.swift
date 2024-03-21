//
//  UIColorExtensions.swift
//  lesson_1
//
//  Created by Stanislav on 14.03.2024.
//

import UIKit

extension UIColor {
    static var random: UIColor {
        
        let color = UIColor(red: .random, green: .random, blue: .random, alpha: 1)
        print("The new random color is: \(color)")
        return color
    }
}
