//
//  ViewController.swift
//  StarTrivia
//
//  Created by Bernardo Teodosio on 16/11/18.
//  Copyright © 2018 Bernardo Teodosio. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PersonRepository().getRandomPersonUrlSession()
    }
}

