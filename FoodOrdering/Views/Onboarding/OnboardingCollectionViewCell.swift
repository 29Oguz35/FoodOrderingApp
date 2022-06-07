//
//  OnboardingCollectionViewCell.swift
//  FoodOrdering
//
//  Created by naruto kurama on 1.06.2022.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "OnboardingCollectionViewCell"
    
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLbl: UILabel!
    @IBOutlet weak var slideDescriptionLbl: UILabel!
    
    
    func setup(_ slide : OnboardingSlide) {
        
        slideTitleLbl.text = slide.title
        slideDescriptionLbl.text = slide.description
        slideImageView.image = slide.image
    }
}

