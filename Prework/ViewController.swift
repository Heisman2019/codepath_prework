//
//  ViewController.swift
//  Prework
//
//  Created by Jack Russell on 1/17/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    var lowRate = 0.15
    var midRate = 0.18
    var highRate = 0.20
    
    let defaults = UserDefaults.standard
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
        
        defaults.set(lowRate, forKey: "low")
        defaults.set(midRate, forKey: "mid")
        defaults.set(highRate, forKey: "high")
        
        defaults.synchronize()
        
        lowRate = defaults.double(forKey: "low")
        midRate = defaults.double(forKey: "mid")
        highRate = defaults.double(forKey: "high")
        
        tipControl.setTitle(String(format: "%.2f", lowRate), forSegmentAt: 0)
        tipControl.setTitle(String(format: "%.2f", midRate), forSegmentAt: 1)
        tipControl.setTitle(String(format: "%.2f", highRate), forSegmentAt: 2)
        
    }

    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        
        let tipPercentages = [lowRate, midRate, highRate]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    
}

