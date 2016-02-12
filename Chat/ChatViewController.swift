//
//  ChatViewController.swift
//  Chat
//
//  Created by eMobc SL on 11/02/16.
//  Copyright © 2016 Neurowork. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var messageChat: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
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
        tableView.delegate = self
        tableView.dataSource = self
        
        NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "onTimer", userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
    }
    
    func onTimer() {
        var query = PFQuery(className:"Message")
        
        /////////////////////////////////////////////////////////////// DOESN'T WORK, MILESTONE 4
        query.orderByDescending(query.createdAt)
        query.whereKey("playerName", equalTo:"Sean Plott")
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                if let objects = objects {
                    for object in objects {
                        print(object.objectId)
                    }
                }
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
        ///////////////////////////////////////////////////////////// 
    }
}
