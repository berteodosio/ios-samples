//
//  RecipeDetailViewController.swift
//  GoodEatings
//
//  Created by Bernardo Teodosio on 16/11/18.
//  Copyright © 2018 Bernardo Teodosio. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeDescription: UILabel!
    
    var recipe: Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRecipeDetails()
    }
    
    private func setupRecipeDetails() {
        recipeImage.image = UIImage(named: recipe.imageName)
        recipeTitle.text = recipe.title
        recipeDescription.text = recipe.instructions
    }
}
