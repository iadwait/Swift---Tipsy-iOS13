//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Adwait Barkale on 23/08/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var result = "0.0"
    var people = 0
    var tipPer = "0"
    
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var lblSetting: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTotal.text = result
        lblSetting.text = "Split between \(people) with \(tipPer.dropLast())% tip."
    }

    @IBAction func btnRecalculateClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
