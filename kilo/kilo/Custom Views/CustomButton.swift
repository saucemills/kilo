//
//  CustomButton.swift
//  kilo
//
//  Created by Jon Miller on 5/27/20.
//  Copyright © 2020 Jon Miller. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setShadow()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setShadow()
    }
    
    private func setShadow() {
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOffset  = CGSize(width: 1, height: 5)
        layer.shadowRadius  = 8
        layer.shadowOpacity = 0.5
        clipsToBounds       = true
        layer.masksToBounds = false
    }
}
