//
//  URLDetailViewController.swift
//  Snip
//
//  Created by Kabir Shah on 8/3/16.
//  Copyright © 2016 Kabir Shah. All rights reserved.
//

import UIKit

class URLDetailViewController: UIViewController {

    @IBOutlet var successLabel: UILabel!
    @IBOutlet var linkButton: UIButton!
    @IBOutlet var shareButton: UIButton!
    var url: NSString?
    var snippedUrl: [String: AnyObject?]?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red:0.01, green:0.09, blue:0.17, alpha:1.0)
        
        successLabel.textColor = UIColor(red:0.00, green:0.59, blue:0.96, alpha:1.0)
        
        snippedUrl = convertStringToDictionary(String(url!))!
        
        linkButton.setTitle(snippedUrl?["snippedURL"] as! String, forState: .Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func linkButtonClicked(sender: UIButton) {
        UIPasteboard.generalPasteboard().string = snippedUrl?["snippedURL"] as! String;
    }
    
    @IBAction func shareButtonClicked(sender: UIButton) {
        displayShareSheet(snippedUrl?["snippedURL"] as! String)
    }
    
    func displayShareSheet(shareContent:String) {
        print(shareContent)
        let activityViewController = UIActivityViewController(activityItems: [shareContent as NSString], applicationActivities: nil)
        presentViewController(activityViewController, animated: true, completion: {})
    }
    
    func convertStringToDictionary(text: String) -> [String:AnyObject]? {
        if let data = text.dataUsingEncoding(NSUTF8StringEncoding) {
            do {
                return try NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String:AnyObject]
            } catch let error as NSError {
                print(error)
            }
        }
        return nil
    }
    
    func navigationControllerSupportedInterfaceOrientations(navigationController: UINavigationController) -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    override func shouldAutorotate() -> Bool {
        // Lock autorotate
        return false
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
