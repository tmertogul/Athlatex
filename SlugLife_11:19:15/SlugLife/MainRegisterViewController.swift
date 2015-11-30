//
//  RegisterViewController.swift
//  ParseTutorial
//
//  Created by Ron Kliffer on 3/6/15.
//  Copyright (c) 2015 Ron Kliffer. All rights reserved.
//

import UIKit

class MainRegisterViewController: UIViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let scrollViewWallSegue = "SignupSuccessful"
    let tableViewWallSegue = "SignupSuccesfulTable"
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showAlert(){
        let alertController = UIAlertController(title: "Invalid User Name", message: "Please enter an @ucsc.edu account name", preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Actions
    @IBAction func signUpPressed(sender: AnyObject) {
        let name = (userTextField.text! as String)
        let user = PFUser()
        user.username = userTextField.text
        user.password = passwordTextField.text
        user.email = userTextField.text
        
        print("here")
        
        //TODO
        //If signup sucessful:
        if(name.hasSuffix("@ucsc.edu")){
            user.signUpInBackgroundWithBlock { succeeded, error in
                if (succeeded) {
                    //The registration was successful, go to the wall
                    user.setValue(false, forKey: "verifiedPoster")
                    user.saveInBackground()
                    self.performSegueWithIdentifier(self.scrollViewWallSegue, sender: nil)
                }else if let error = error{
                    //Something bad has occurred
                    self.showErrorView(error)
                }
            }
        }else{
            self.showAlert()
        }
    }
    
}
