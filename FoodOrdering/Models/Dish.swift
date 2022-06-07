//
//  Dish.swift
//  FoodOrdering
//
//  Created by naruto kurama on 1.06.2022.
//

import Foundation

struct Dish : Decodable {
    let id : String?
    let name : String?
    let description : String?
    let image : String?
    let calories : Int?
    
    var formattedCalories : String {
        return "\(calories ?? 0) calories"
    }
}
