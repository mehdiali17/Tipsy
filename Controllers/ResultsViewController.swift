//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Mehdi Ali on 16/7/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var result: Float = 0.0
    var tipAmount: Float = 0.0
    var persons: Int = 0

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = String(round(100 * result) / 100)
        
        settingsLabel.text = "Split between \(persons) people, with \(Int(tipAmount * 100))% tip."
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
