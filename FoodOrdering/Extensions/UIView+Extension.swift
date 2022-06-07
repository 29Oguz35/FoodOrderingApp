//
//  UIView+Extension.swift
//  FoodOrdering
//
//  Created by naruto kurama on 1.06.2022.
//

import UIKit

extension UIView {
    
   @IBInspectable var cornerRadius : CGFloat {
       get { return self.cornerRadius}
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
