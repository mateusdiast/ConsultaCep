//
//  ViewController.swift
//  ConsultaCep
//
//  Created by mateusdias on 05/10/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func buttonClickToSecondView(_ sender: UIButton) {
        performSegue(withIdentifier: "SecondVc", sender: self)
    }
    
}




