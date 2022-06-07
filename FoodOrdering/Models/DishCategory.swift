//
//  DishCategory.swift
//  FoodOrdering
//
//  Created by naruto kurama on 1.06.2022.
//

import Foundation

struct DishCategory : Decodable {
    let id : String?
    let name : String?
    let image : String?
    
    enum CodingKeys : String, CodingKey {
        case id
        case name = "title"
        case image
    }
}
