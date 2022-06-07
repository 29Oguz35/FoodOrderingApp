//
//  DishListTableViewCell.swift
//  FoodOrdering
//
//  Created by naruto kurama on 2.06.2022.
//

import UIKit

class DishListTableViewCell: UITableViewCell {
    
    static let identifier = "DishListTableViewCell"
    
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    func setup(dish: Dish) {
          dishImageView.kf.setImage(with: dish.image?.asURL)
          titleLbl.text = dish.name
          descriptionLbl.text = dish.description
      }
      
      func setup(order: Order) {
          dishImageView.kf.setImage(with: order.dish?.image?.asURL)
          titleLbl.text = order.dish?.name
          descriptionLbl.text = order.name
      }
  }
