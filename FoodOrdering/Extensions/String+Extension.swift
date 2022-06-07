//
//  String+Extension.swift
//  FoodOrdering
//
//  Created by naruto kurama on 1.06.2022.
//

import Foundation

extension String {
    
    var asURL : URL? {
        return URL(string: self)
    }

}
