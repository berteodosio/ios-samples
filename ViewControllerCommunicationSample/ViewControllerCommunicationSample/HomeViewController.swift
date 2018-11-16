//
//  ViewController.swift
//  ViewControllerCommunicationSample
//
//  Created by Bernardo Teodosio on 15/11/18.
//  Copyright © 2018 Bernardo Teodosio. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, SomethingTypedDelegate {

    @IBOutlet weak var displayedText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func onSomethingTyped(typedText: String) {
        displayedText.text = typedText
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let inputTextViewController = segue.destination as? InputTextViewController else { return }
        inputTextViewController.somethingTypedDelegate = self
    }


}

