//
//  CategoryCollectionViewCell.swift
//  FoodOrdering
//
//  Created by naruto kurama on 1.06.2022.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoryCollectionViewCell"

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLbl: UILabel!
    
    
    func setup(category : DishCategory) {
        
        categoryTitleLbl.text = category.name
        categoryImageView.kf.setImage(with: category.image?.asURL)
    }
}
