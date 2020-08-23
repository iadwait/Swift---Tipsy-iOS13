//
//  ViewController.swift
//  Tipsy
//
//  Created by Adwait Barkale on 23/08/2020.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var txtbill: UITextField!
    @IBOutlet weak var btnZeroPercent: UIButton!
    @IBOutlet weak var btnTenPercent: UIButton!
    @IBOutlet weak var btnTwentyPercent: UIButton!
    @IBOutlet weak var lblSplitNumber: UILabel!
    
    var tipPer:Double?
    var splitNum:Int?
    var tag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.numberOfTouchesRequired = 1
        view.addGestureRecognizer(tap)
        btnZeroPercent.tag = 0
        btnTenPercent.tag = 1
        btnTwentyPercent.tag = 2
    }

    @objc func dismissKeyboard()
    {
        txtbill.endEditing(true)
    }
    
    @IBAction func btnTipChanged(_ sender: UIButton) {
        tag = sender.tag
        if sender.tag == 0{
            btnZeroPercent.isSelected = true
            btnTenPercent.isSelected = false
            btnTwentyPercent.isSelected = false
            tipPer = 0.0
        }else if sender.tag == 1{
            btnZeroPercent.isSelected = false
            btnTenPercent.isSelected = true
            btnTwentyPercent.isSelected = false
            tipPer = 0.1
        }else{
            btnZeroPercent.isSelected = false
            btnTenPercent.isSelected = false
            btnTwentyPercent.isSelected = true
            tipPer = 0.2
        }
    }
    
    
    @IBAction func btnStepperChanged(_ sender: UIStepper) {
        //print(sender.value)
        splitNum = Int(String(format: "%0.f", sender.value))
        lblSplitNumber.text = String(format: "%0.f", sender.value)
    }
    
    @IBAction func btnCalculatePressed(_ sender: UIButton) {
        
        let bill = txtbill.text
        var billTotal = 0.0
        billTotal = Double(bill!)!
        
        let result = billTotal * (1 + tipPer!) / Double(splitNum!)
        let resultTo2DecimalPlaces = String(format: "%.2f", result)
        //print(resultTo2DecimalPlaces)
        
        let nextVC = storyboard?.instantiateViewController(identifier: "ResultViewController") as! ResultViewController
        nextVC.result = resultTo2DecimalPlaces
        nextVC.people = splitNum!
        nextVC.tipPer = String(tag * 100)
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}

