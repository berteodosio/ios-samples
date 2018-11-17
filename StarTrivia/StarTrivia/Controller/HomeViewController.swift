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
    @IBOutlet weak var personGender: UILabel!
    @IBOutlet weak var personBirth: UILabel!
    @IBOutlet weak var personHair: UILabel!
    @IBOutlet weak var personMass: UILabel!
    @IBOutlet weak var personHeight: UILabel!
    
    private let personRepository = PersonRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onRandomClick(_ sender: Any) {
        let randomId = Int.random(in: 0...87)
        personRepository.getRandomPersonUrlSession(randomPersonId: randomId) { (person) in
            guard let person = person else { self.displayErrorLoadingPerson(); return }
            self.displayPerson(person)
        }
    }
    
    private func displayPerson(_ person: Person) {
        personName.text = person.name
        personGender.text = person.gender
        personBirth.text = person.birthYear
        personHair.text = person.hairColor
        personMass.text = person.mass
        personHeight.text = person.height
    }
    
    private func displayErrorLoadingPerson() {
        // TODO
    }
}

