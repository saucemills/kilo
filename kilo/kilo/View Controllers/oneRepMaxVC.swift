//
//  oneRepMaxVC.swift
//  kilo
//
//  Created by Jon Miller on 5/27/20.
//  Copyright © 2020 Jon Miller. All rights reserved.
//

import UIKit

class oneRepMaxVC: UIViewController {
    
    @IBOutlet weak var weightText: UITextField!
    @IBOutlet weak var repsText: UITextField!
    @IBOutlet weak var maxLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func calcTapped(_ sender: Any) {
        
        let weight = Double(weightText.text!)
        let reps = Double(repsText.text!)
        let max = (weight! * reps! * 0.033) + weight!
        maxLabel.text = "\(max) e1RM"
    }
    
}
