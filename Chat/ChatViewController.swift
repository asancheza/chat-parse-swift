//
//  ChatViewController.swift
//  Chat
//
//  Created by eMobc SL on 11/02/16.
//  Copyright © 2016 Neurowork. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController {
    @IBOutlet weak var messageChat: UITextField!
    
    @IBAction func onSend(sender: AnyObject) {
        var message = PFObject(className:"Message")
        message["text"] = messageChat.text
        
        message.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                print("Message has been sent")
            } else {
                // There was a problem, check error.description
            }
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
