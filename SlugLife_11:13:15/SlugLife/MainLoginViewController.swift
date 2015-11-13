//
//  LoginViewController.swift
//  ParseTutorial
//
//  Created by Ron Kliffer on 3/6/15.
//  Copyright (c) 2015 Ron Kliffer. All rights reserved.
//

import UIKit

class MainLoginViewController: UIViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let scrollViewWallSegue = "LoginSuccessful"
    let tableViewWallSegue = "LoginSuccesfulTable"
    let scroll = "LoginDefaultUserSuccessful"
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showAlert() {
        let alertController = UIAlertController(title: "Invalid User Name", message: "Please enter an @ucsc.edu account name", preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Actions
    @IBAction func logInPressed(sender: AnyObject) {
        
        let name = (userTextField.text! as String)
        
        if(name.hasSuffix("@ucsc.edu")){
            PFUser.logInWithUsernameInBackground(userTextField.text!, password: passwordTextField.text!) { user, error in
                
                if user != nil {
                
                    print (PFUser.currentUser())
                    let curUser = PFUser.currentUser()
                    let i = curUser!["verifiedPoster"] as! Bool
                
                     if user!["emailVerified"] as! Bool == true{
                        if (i == true){
                            self.performSegueWithIdentifier(self.scrollViewWallSegue, sender: nil)
                            print("verified user")
                        }else{
                            self.performSegueWithIdentifier(self.scroll, sender: nil)
                            print("unverified user")
                        }
                    }else if let error = error{
                        self.showErrorView(error)
                    }
                }
            }
        }else{
            self.showAlert()
        }
    }
    
}