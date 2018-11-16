//
//  RecipeCollectionViewCell.swift
//  GoodEatings
//
//  Created by Bernardo Teodosio on 15/11/18.
//  Copyright © 2018 Bernardo Teodosio. All rights reserved.
//

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeName: UILabel!
    
    override func awakeFromNib() {
        recipeImage.layer.cornerRadius = 10
    }
    
    func configureContent(recipe: Recipe) {
        recipeImage.image = UIImage(named: recipe.imageName)
        recipeName.text = recipe.title
    }
}
