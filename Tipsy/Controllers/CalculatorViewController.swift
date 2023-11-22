//
//  ViewController.swift
//  Tipsy
//
//  Created by Andrei Shpartou on 21/11/2023.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var splitStepper: UIStepper!
    
    var totalAmount: Double?
    var tip: Double?
    var splitCount: Double = 2
    var result: Double = 0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let tipStringNumberTitle = String(sender.currentTitle!.dropLast())
        tip = Double(tipStringNumberTitle)! / 100
    }
        
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
                
        splitCount = splitStepper.value
        
        totalAmount = Double(billTextField.text!)
        
        result = (totalAmount ?? 0) * (1 + (tip ?? -1)) / splitCount
        print(String(format: "%.2f", result))
        
    }
    
}

