//
//  ViewController.swift
//  Chat
//
//  Created by eMobc SL on 11/02/16.
//  Copyright © 2016 Neurowork. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogin(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground("\(emailTextField.text)", password:"\(passwordTextField.text)") {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let vc: UIViewController = storyboard.instantiateViewControllerWithIdentifier("ChatViewController") as UIViewController

                self.presentViewController(vc, animated: true, completion: nil)
            } else {
                // The login failed. Check error to see why.
                /*let alert = UIAlertView()
                alert.title = "Login failed"
                alert.message = "Error login"
                alert.addButtonWithTitle("Ok")
                alert.show()*/
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let vc: UIViewController = storyboard.instantiateViewControllerWithIdentifier("ChatViewController") as UIViewController
                
                self.presentViewController(vc, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func onSignUp(sender: AnyObject) {
        var user = PFUser()
        
        user.username = emailTextField.text
        user.password = passwordTextField.text
        user.email = emailTextField.text
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo["error"] as? NSString
                // Show the errorString somewhere and let the user try again.
                let alert = UIAlertView()
                alert.title = "Error signing up"
                alert.message = errorString as! String
                alert.addButtonWithTitle("Okay")
                alert.show()
            } else {
                // Hooray! Let them use the app now.
            }
        }
    }
}