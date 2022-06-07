//
//  Order.swift
//  FoodOrdering
//
//  Created by naruto kurama on 2.06.2022.
//

import Foundation

struct Order : Decodable {
    
    let id: String?
    let name: String?
    let dish: Dish?
}
