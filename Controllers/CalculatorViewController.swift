//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    var tipSelected: Float = 0.1
    var persons: Float = 2.0
    var splitBill: Float = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        unselectButtons()
        sender.isSelected = true
        
        switch sender.currentTitle{
        case "0%" :
            self.tipSelected = 0.0
        case "10%" :
            self.tipSelected = 0.1
        case "20%" :
            self.tipSelected = 0.2
        default:
            self.tipSelected = 0.0
        }
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(stepper.value))
        persons = Float(stepper.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let amount =  Float(billTextField.text ?? "0.0") ?? 0.0
        
        splitBill = (amount + (amount * tipSelected)) / persons
        
        print (splitBill)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    func unselectButtons(){
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let desitnationVC = segue.destination as! ResultsViewController
            desitnationVC.persons = Int(persons)
            desitnationVC.result = splitBill
            desitnationVC.tipAmount = tipSelected
        }
    }
}

