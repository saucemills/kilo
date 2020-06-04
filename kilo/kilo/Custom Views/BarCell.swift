//
//  BarCell.swift
//  kilo
//
//  Created by Jon Miller on 5/28/20.
//  Copyright © 2020 Jon Miller. All rights reserved.
//

import UIKit

class BarCell: UICollectionViewCell {
    
    @IBOutlet weak var barImageView: UIImageView!
    
    
    
    
    func set(plate: Plate) {
        
        barImageView.image = UIImage(named: plate.loadedPlate)
    }
}
