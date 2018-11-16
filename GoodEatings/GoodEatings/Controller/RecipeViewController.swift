//
//  RecipeViewController.swift
//  GoodEatings
//
//  Created by Bernardo Teodosio on 15/11/18.
//  Copyright © 2018 Bernardo Teodosio. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {
    
    var selectedCategory: String!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private lazy var recipes: [Recipe] = {
        return DataSet().getRecipes(forCategoryTitle: selectedCategory)
    }()
    
    private var selectedRecipe: Recipe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let recipeDetailViewController = segue.destination as? RecipeDetailViewController else { return }
        recipeDetailViewController.recipe = self.selectedRecipe
    }

}

extension RecipeViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = view.bounds.width
        let cellDimension = (screenWidth / 2) - 30
        return CGSize(width: cellDimension, height: cellDimension)
    }
}

extension RecipeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedRecipe = recipes[indexPath.row]
        performSegue(withIdentifier: "navigateToRecipeDetails", sender: self)
    }
    
}

extension RecipeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recipeCell", for: indexPath) as? RecipeCollectionViewCell else { return UICollectionViewCell() }
        cell.configureContent(recipe: recipes[indexPath.row])
        return cell
    }
    
    
}
