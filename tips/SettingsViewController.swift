//
//  SettingsViewController.swift
//  tips
//
//  Created by Sumeet Singh Arora on 12/16/15.
//  Copyright © 2015 codersvilla. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultIndex = defaults.integerForKey("defaultIndex")
        defaultTipControl.selectedSegmentIndex = defaultIndex
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func setDefault(sender: AnyObject) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
       
        var tipPercentages = [0.18, 0.2, 0.25]
        
        var defaultTip = tipPercentages[defaultTipControl.selectedSegmentIndex]
        
        defaults.setDouble(defaultTip, forKey: "default_tip_percentage")
        defaults.setInteger(defaultTipControl.selectedSegmentIndex, forKey: "defaultIndex")
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
