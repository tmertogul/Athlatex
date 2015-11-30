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
    @IBOutlet weak var passwordTextFieldConfirm: UITextField!

    let scrollViewWallSegue = "SignupSuccessful"
    let tableViewWallSegue = "SignupSuccesfulTable"
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    @IBAction func signUpPressed(sender: AnyObject) {
        let user = PFUser()
        if( passwordTextField.text == passwordTextFieldConfirm.text){
            user.username = userTextField.text
            user.password = passwordTextField.text
            user.email = userTextField.text
        } else {
            print("passwords do not match")
        }
        
        //TODO
        //If signup sucessful:
        user.signUpInBackgroundWithBlock { succeeded, error in
            if (succeeded) {
                //The registration was successful, go to the wall
                //

                self.performSegueWithIdentifier(self.scrollViewWallSegue, sender: nil)
            } else if let error = error {
                //Something bad has occurred
                self.showErrorView(error)
            }
        }
    }
}
