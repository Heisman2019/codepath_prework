//
//  SettingsViewController.swift
//  Prework
//
//  Created by Jack Russell on 1/17/22.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var lowTipInput: UITextField!
    @IBOutlet weak var midTipInput: UITextField!
    @IBOutlet weak var highTipInput: UITextField!
    
    var lowest = 0.0
    var middle = 0.0
    var highest = 0.0
    
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lowest = defaults.double(forKey: "low")
        middle = defaults.double(forKey: "mid")
        highest = defaults.double(forKey: "high")
        
        lowTipInput.placeholder = String(format: "%.2f", lowest)
        midTipInput.placeholder = String(format: "%.2f", middle)
        highTipInput.placeholder = String(format: "%.2f", highest)

        // Do any additional setup after loading the view.
    }
    @IBAction func changeTip(_ sender: Any) {
        lowest = Double(lowTipInput.text!) ?? lowest
        middle = Double(midTipInput.text!) ?? middle
        highest = Double(highTipInput.text!) ?? highest
        
        defaults.set(lowest, forKey: "low")
        defaults.set(middle, forKey: "mid")
        defaults.set(highest, forKey: "high")
        
        defaults.synchronize()
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
