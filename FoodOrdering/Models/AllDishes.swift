//
//  AllDishes.swift
//  FoodOrdering
//
//  Created by naruto kurama on 2.06.2022.
//

import Foundation


struct AllDishes: Decodable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}
