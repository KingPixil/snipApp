//
//  ViewController.swift
//  Snip
//
//  Created by Kabir Shah on 8/2/16.
//  Copyright © 2016 Kabir Shah. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var snipLabel: UILabel!
    @IBOutlet var urlTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red:0.01, green:0.09, blue:0.17, alpha:1.0)
        
        urlTextField.delegate = selfs
        
        snipLabel.textColor = UIColor(red:0.00, green:0.59, blue:0.96, alpha:1.0)
        
        urlTextField.textColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1.0)
        let str = NSAttributedString(string: "URL", attributes: [NSForegroundColorAttributeName:UIColor(red:0.96, green:0.96, blue:0.96, alpha:1.0)])
        urlTextField.attributedPlaceholder = str
        urlTextField.backgroundColor = UIColor.clearColor()
        urlTextField.layer.borderWidth = 3
        urlTextField.layer.borderColor = UIColor(red:0.00, green:0.59, blue:0.96, alpha:1.0).CGColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }


}

