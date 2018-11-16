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
    
    private lazy var recipes: [Recipe] = {
        return DataSet().getRecipes(forCategoryTitle: selectedCategory)
    }()

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension RecipeViewController: UICollectionViewDelegate {
    
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
