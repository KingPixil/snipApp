//
//  URLDetailViewController.swift
//  Snip
//
//  Created by Kabir Shah on 8/3/16.
//  Copyright © 2016 Kabir Shah. All rights reserved.
//

import UIKit

class URLDetailViewController: UIViewController {

    @IBOutlet var linkButton: UIButton!
    @IBOutlet var shareButton: UIButton!
    var url: NSString?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func linkButtonClicked(sender: UIButton) {
        UIPasteboard.generalPasteboard().string = String(url);
    }
    
    @IBAction func shareButtonClicked(sender: UIButton) {
    }
    
    func displayShareSheet(shareContent:String) {
        let activityViewController = UIActivityViewController(activityItems: [shareContent as NSString], applicationActivities: nil)
        presentViewController(activityViewController, animated: true, completion: {})
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
