//
//  FoodCategoryTableViewCell.swift
//  GoodEatings
//
//  Created by Bernardo Teodosio on 15/11/18.
//  Copyright © 2018 Bernardo Teodosio. All rights reserved.
//

import UIKit

class FoodCategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundImage.layer.cornerRadius = 10
    }
    
    func configureFoodCategory(_ foodCategory: FoodCategory) {
        backgroundImage.image = UIImage(named: foodCategory.imageName)
        categoryTitle.text = foodCategory.title
    }

}
