//
//  PlateCell.swift
//  kilo
//
//  Created by Jon Miller on 5/28/20.
//  Copyright © 2020 Jon Miller. All rights reserved.
//

import UIKit

class PlateCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var plateImageView: UIImageView!
    
    func set(plate: Plate) {
        plateImageView.image = UIImage(named: plate.plate)
    }
}
