//
//  barLoaderVC.swift
//  kilo
//
//  Created by Jon Miller on 5/30/20.
//  Copyright © 2020 Jon Miller. All rights reserved.
//

import UIKit

class barLoaderVC: UIViewController {
    
    @IBOutlet weak var kgLabel: UILabel!
    @IBOutlet weak var lbLabel: UILabel!
    @IBOutlet weak var barCollView: UICollectionView!
    @IBOutlet weak var plateCollView: UICollectionView!
    
    var plates: [Plate] = []
    var bar: [Plate]    = []
    
    var is20kgBar: Bool         = true
    var areCollarsOn: Bool      = false
    var kgWeight: Double        = 20
    var lbWeight: Double        = 0.0
    var barWeight: Double       = 20
    var collarWeight: Double    = 0
    
    let twentyFive  = Plate(plate: "25kgplate", loadedPlate: "loaded25", value: 50)
    let twenty      = Plate(plate: "20kgplate", loadedPlate: "loaded20", value: 40)
    let fifteen     = Plate(plate: "15kgplate", loadedPlate: "loaded15", value: 30)
    let ten         = Plate(plate: "10kgplate", loadedPlate: "loaded10", value: 20)
    let five        = Plate(plate: "5kgplate", loadedPlate: "loaded5", value: 10)
    let two         = Plate(plate: "2point5kgplate", loadedPlate: "loaded2", value: 5)
    let one         = Plate(plate: "1kgplate", loadedPlate: "loaded1", value: 2.5)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollViews()
        plates = createArray()
        configureLabels()
    }
    
    func configureCollViews() {
        barCollView.delegate = self
        plateCollView.delegate = self
        barCollView.dataSource = self
        plateCollView.dataSource = self
        
    }
    
    func createArray() -> [Plate] {
        
        var tempArray: [Plate] = []
        
        tempArray.append(twentyFive)
        tempArray.append(twenty)
        tempArray.append(fifteen)
        tempArray.append(ten)
        tempArray.append(five)
        tempArray.append(two)
        tempArray.append(one)
        
        return tempArray
    }
    
    func sumPlates() -> Double {
        
        var sum: Double = 0
        
        for plate in bar {
            sum += plate.value
        }
        
        return sum
    }
    
    func configureLabels() {
        
        kgWeight = barWeight + collarWeight + sumPlates()
        lbWeight = kgWeight * 2.205
        let stringLB = String(format: "%.2f lbs", lbWeight)
        
        kgLabel.text = "\(kgWeight) kg"
        lbLabel.text = stringLB
    }
    
    @IBAction func barValueChanged(_ sender: Any) {
        
        is20kgBar.toggle()
        
        if is20kgBar {
            
            barWeight = 20
        }
        else {
            barWeight = 25
        }
        configureLabels()
    }
    
    
    @IBAction func collarValueChanged(_ sender: Any) {
        
        areCollarsOn.toggle()
        
        if areCollarsOn {
            
            collarWeight = 5
        }
        else {
            
            collarWeight = 0
        }
        configureLabels()
    }
    
    
    @IBAction func removeTapped(_ sender: Any) {
        
        if !bar.isEmpty {
            
            bar.removeLast()
            barCollView.reloadData()
            configureLabels()
        }
    }
    
    
    @IBAction func clearTapped(_ sender: Any) {
        
        if !bar.isEmpty {
            
            bar.removeAll()
            barCollView.reloadData()
            configureLabels()
        }
    }
}

extension barLoaderVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == plateCollView {
            return plates.count
        }
        else {
            return bar.count
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == plateCollView {
            
            let plate = plates[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlateCell", for: indexPath) as! PlateCell
            cell.set(plate: plate)
            return cell
        }
        else {
            
            let plate = bar[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BarCell", for: indexPath) as! BarCell
            cell.set(plate: plate)
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == plateCollView {
            
            let plate = plates[indexPath.row]
            bar.append(plate)
            barCollView.reloadData()
            configureLabels()
        }
        
    }
    

    
}
