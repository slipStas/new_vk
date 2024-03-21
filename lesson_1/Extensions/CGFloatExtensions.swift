//
//  CGFloatExtensions.swift
//  lesson_1
//
//  Created by Stanislav on 14.03.2024.
//

import UIKit

extension CGFloat {
    static var random: CGFloat {
        CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
