//
//  ViewController.swift
//  tips
//
//  Created by Sumeet Singh Arora on 12/14/15.
//  Copyright © 2015 codersvilla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    @IBOutlet weak var border: UIView!
    
    @IBOutlet weak var billAmount: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
      
        /*   billField.center.x  -= view.bounds.width
        billAmount.center.x -= view.bounds.width */
        
        border.alpha = 0
        
    }
    
    func calculateInternal(tipValue: Double)
    {
        var billAmount = NSString(string: billField.text!).doubleValue
        var tip = billAmount * tipValue
        var totalAmount = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(totalAmount)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", totalAmount)
        

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let defaultIndex = defaults.integerForKey("defaultIndex")
        tipControl.selectedSegmentIndex = defaultIndex
        /*
        UIView.animateWithDuration(0.1, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.billField.center.x  += self.view.bounds.width
            self.billAmount.center.x += self.view.bounds.width
            self.view.layoutIfNeeded()
            }, completion: nil) */
        
        let tipValue = defaults.doubleForKey("default_tip_percentage")
        calculateInternal(tipValue)
        
        UIView.animateWithDuration(2.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.border.alpha = 2;
            self.view.layoutIfNeeded()
            }, completion: nil)

        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(0, forKey: "defaultIndex")
        defaults.synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.25]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        calculateInternal(tipPercentage)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

