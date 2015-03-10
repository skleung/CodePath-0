//
//  ViewController.swift
//  tips
//
//  Created by Sherman Leung on 3/10/15.
//  Copyright (c) 2015 Sherman Leung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // define outlets
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var numPeople: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = "$0.00";
    }

    // links the tap gesture to ending the keyboard
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billFieldText = billField.text
        if (billFieldText.hasPrefix("$")){
            billFieldText = billFieldText.substringFromIndex(advance(billFieldText.startIndex,1))
        }
        var numPersons = Double(numPeople.selectedSegmentIndex+1)
        var billAmount = (billFieldText as NSString).doubleValue
        var tip = billAmount * tipPercentage
        var total = (billAmount + tip)/numPersons
        if (!billField.text.hasPrefix("$")){
            billField.text = "$"+billField.text
        }
        totalLabel.text = String(format: "$%.2f", total)
    }
}

