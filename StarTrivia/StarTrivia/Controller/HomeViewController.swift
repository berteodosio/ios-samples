//
//  ViewController.swift
//  StarTrivia
//
//  Created by Bernardo Teodosio on 16/11/18.
//  Copyright © 2018 Bernardo Teodosio. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var personName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PersonRepository().getRandomPersonUrlSession { (person) in
            guard let person = person else { self.displayErrorLoadingPerson(); return }
            self.displayPerson(person)
        }
    }
    
    private func displayPerson(_ person: Person) {
        DispatchQueue.main.async {
            self.personName.text = person.name
        }        
    }
    
    private func displayErrorLoadingPerson() {
        // TODO
    }
}

