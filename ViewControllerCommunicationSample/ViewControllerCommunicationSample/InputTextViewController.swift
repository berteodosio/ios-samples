//
//  InputTextViewController.swift
//  ViewControllerCommunicationSample
//
//  Created by Bernardo Teodosio on 15/11/18.
//  Copyright © 2018 Bernardo Teodosio. All rights reserved.
//

import UIKit
import Foundation

class InputTextViewController : UIViewController {
    
    @IBOutlet weak var inputTextField: UITextField!
    
    var somethingTypedDelegate: SomethingTypedDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onDoneClick(_ sender: Any) {
        somethingTypedDelegate?.onSomethingTyped(typedText: inputTextField.text ?? "no_name")
        dismiss(animated: true, completion: nil)
    }
}
