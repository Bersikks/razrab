//
//  UIView+Extensions.swift
//  medic_smartlab
//
//  Created by Berezhnova <3 on 24.01.2024.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {return cornerRadius}
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
