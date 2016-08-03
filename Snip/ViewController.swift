//
//  ViewController.swift
//  Snip
//
//  Created by Kabir Shah on 8/2/16.
//  Copyright © 2016 Kabir Shah. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {

    @IBOutlet var snipLabel: UILabel!
    @IBOutlet var urlTextField: UITextField!
    
    var snippedURL: NSString?
    override func viewDidLoad() {
        super.viewDidLoad()
        urlTextField.delegate = self;
        
        
        self.view.backgroundColor = UIColor(red:0.01, green:0.09, blue:0.17, alpha:1.0)
        
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
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true;
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        var urlToShorten = textField.text
        
        let url = NSURL(string: "https://snip-kingsofcoding.c9users.io/shorten/url?url=http://" + urlToShorten!)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            self.snippedURL = NSString(data: data!, encoding: NSUTF8StringEncoding)
            dispatch_async(dispatch_get_main_queue(), {
                self.performSegueWithIdentifier("ShowURLDetailSegue", sender: textField)
            })
            
        }
        
        task.resume()
        
        return true;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowURLDetailSegue"
        {
            if let destinationVC = segue.destinationViewController as? URLDetailViewController {
                destinationVC.url = "URL"
            }
        }
    }
    
    func navigationControllerSupportedInterfaceOrientations(navigationController: UINavigationController) -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    override func shouldAutorotate() -> Bool {
        // Lock autorotate
        return false
    }
    
    


}

