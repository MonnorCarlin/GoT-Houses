//
//  HouseDetailViewController.swift
//  GoT-Houses
//
//  Created by Laird Connor Stephen Marlin I, Exquire on 6/19.
//  Copyright © 2019 Laird Connor Stephen Marlin I, Exquire. All rights reserved.
//

import UIKit

class HouseDetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var wordsLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var regionImageView: UIImageView!
    @IBOutlet weak var coatOfArmsTextView: UITextView!
    @IBOutlet weak var coatOfArmsLabel: UILabel!
    
    var houseInfo = HousesInfo() // catches everything thrown from original ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUserInterface()

    }
    
    func updateUserInterface() {
        nameLabel.text = houseInfo.name
        regionLabel.text = houseInfo.region
        if houseInfo.coatOfArms == "" {
            coatOfArmsLabel.isHidden = true
        }
        coatOfArmsTextView.text = houseInfo.coatOfArms
        if houseInfo.words != "" {
            wordsLabel.text = houseInfo.words + String("\"")
        }
        regionImageView.image = UIImage(named: houseInfo.region)
    }
}
