//
//  ApiResponse.swift
//  FoodOrdering
//
//  Created by naruto kurama on 2.06.2022.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
