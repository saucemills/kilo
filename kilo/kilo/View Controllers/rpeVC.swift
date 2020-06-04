//
//  rpeVC.swift
//  kilo
//
//  Created by Jon Miller on 5/27/20.
//  Copyright © 2020 Jon Miller. All rights reserved.
//

import UIKit

class rpeVC: UIViewController {
    
    @IBOutlet weak var maxLabel: UITextField!
    @IBOutlet weak var repsLabel: UITextField!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var rpeLabel: UILabel!
    @IBOutlet weak var targetLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func calcTapped(_ sender: Any) {
        let target = calcRPE(max: maxLabel.text!, reps: repsLabel.text!, rpe: rpeLabel.text!)
        targetLabel.text = "Target weight: \(target)"
    }
    
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        
        let rpeValues = [6, 6.5, 7, 7.5, 8, 8.5, 9, 9.5, 10]
        let rpeValue = rpeValues[Int(roundf(slider.value))-1]
        
        rpeLabel.text = "\(rpeValue)"
    }
    
    func calcRPE(max:String, reps:String, rpe:String) -> Double {
        let maxDouble = Double(max)!
        let repsDouble = Double(reps)!
        let rpeDouble = Double(rpe)!
        
        let rpeChart =  [1.0: [6.0: 0.865, 6.5: 0.878, 7.0: 0.892, 7.5: 0.907, 8.0: 0.922, 8.5: 0.939, 9.0: 0.955, 9.5:0.978,10.0:1.0],
                         2.0: [6.0: 0.838, 6.5: 0.85, 7.0: 0.863, 7.5: 0.878, 8.0: 0.892, 8.5: 0.907, 9.0: 0.922, 9.5:0.939,10.0:0.955],
                         3.0: [6.0: 0.818, 6.5: 0.824, 7.0: 0.837, 7.5: 0.85, 8.0: 0.863, 8.5: 0.878, 9.0: 0.892, 9.5:0.907,10.0:0.922],
                         4.0: [6.0: 0.788, 6.5: 0.799, 7.0: 0.811, 7.5: 0.824, 8.0: 0.837, 8.5: 0.85, 9.0: 0.863, 9.5:0.878,10.0:0.892],
                         5.0: [6.0: 0.768, 6.5: 0.774, 7.0: 0.786, 7.5: 0.799, 8.0: 0.811, 8.5: 0.824, 9.0: 0.837, 9.5:0.85,10.0:0.863],
                         6.0: [6.0: 0.76, 6.5: 0.751, 7.0: 0.762, 7.5: 0.774, 8.0: 0.786, 8.5: 0.799, 9.0: 0.811, 9.5:0.824,10.0:0.837],
                         7.0: [6.0: 0.71, 6.5: 0.723, 7.0: 0.739, 7.5: 0.751, 8.0: 0.762, 8.5: 0.774, 9.0: 0.786, 9.5:0.799,10.0:0.811],
                         8.0: [6.0: 0.68, 6.5: 0.694, 7.0: 0.707, 7.5: 0.723, 8.0: 0.739, 8.5: 0.751, 9.0: 0.762, 9.5:0.774,10.0:0.786],
                         9.0: [6.0: 0.65, 6.5: 0.667, 7.0: 0.68, 7.5: 0.694, 8.0: 0.707, 8.5: 0.723, 9.0: 0.739, 9.5:0.751,10.0:0.762],
                         10.0: [6.0: 0.63, 6.5: 0.64, 7.0: 0.653, 7.5: 0.667, 8.0: 0.68, 8.5: 0.694, 9.0: 0.707, 9.5:0.723,10.0:0.739]]
        
        let target: Double = maxDouble * rpeChart[repsDouble]![rpeDouble]!
        return target
    }
    
}
