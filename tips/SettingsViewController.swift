//
//  SettingsViewController.swift
//  tips
//
//  Created by Sherman Leung on 3/16/15.
//  Copyright (c) 2015 Sherman Leung. All rights reserved.
//

import Foundation
import UIKit


class SettingsViewController: UIViewController {
    @IBOutlet var default_tip: UISegmentedControl!
    @IBOutlet var default_num: UISegmentedControl!
    
    override func viewWillAppear(animated: Bool) {
        var defaults = NSUserDefaults.standardUserDefaults()
        if (defaults.objectForKey("default_tip_index") != nil) {
            default_tip.selectedSegmentIndex = defaults.integerForKey("default_tip_index")
        } else {
            defaults.setInteger(0, forKey: "default_tip_index")
        }
        if (defaults.objectForKey("default_num_people_index") != nil) {
            default_tip.selectedSegmentIndex = defaults.integerForKey("default_num_people_index")
        } else {
            defaults.setInteger(0, forKey: "default_num_people_index")
        }
        defaults.synchronize()
    }
    
    @IBAction func change_default_tip(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(default_tip.selectedSegmentIndex, forKey: "default_tip_index")
        defaults.synchronize()
    }
    
    @IBAction func change_default_num(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(default_num.selectedSegmentIndex, forKey: "default_num_people_index")
        defaults.synchronize()
    }
    
}