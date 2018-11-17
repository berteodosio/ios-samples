//
//  BlackBackgroundView.swift
//  StarTrivia
//
//  Created by Bernardo Teodosio on 16/11/18.
//  Copyright © 2018 Bernardo Teodosio. All rights reserved.
//

import UIKit

class BlackBackgroundView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.backgroundColor = UIColor.black.withAlphaComponent(0.6).cgColor
        layer.cornerRadius = 15
    }

}
