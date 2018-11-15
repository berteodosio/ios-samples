//
//  ViewController.swift
//  TechnologiesBot
//
//  Created by Bernardo Teodosio on 15/11/18.
//  Copyright © 2018 Bernardo Teodosio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var technologiesLabel: UILabel!
    @IBOutlet weak var showsLabel: UILabel!
    @IBOutlet weak var responseLabel: UILabel!
    @IBOutlet weak var chooseShowButton: UIButton!
    @IBOutlet weak var showTextField: UITextField!
    
    private var shows: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        technologiesLabel.isHidden = true
        showsLabel.isHidden = true
        responseLabel.isHidden = true
        chooseShowButton.isHidden = true
    }

    @IBAction func onAddShowButtonClick(_ sender: Any) {
        guard let showText = showTextField.text else { return }
        shows.append(showText)
        displayShows()
        showTextField.text = ""
    }
    
    private func displayShows() {
        showsLabel.text = shows.joined(separator: ", ")
        if showsLabel.text?.isEmpty == false {
            showsLabel.isHidden = false
            technologiesLabel.isHidden = false
        }
    }
    
}

