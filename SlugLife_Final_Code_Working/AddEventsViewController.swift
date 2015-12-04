//
//  AddEventsViewController.swift
//  SlugLife
//
//  Created by Daniel Urrutia on 10/13/15.
//  Copyright © 2015 Tim Mertogul. All rights reserved.
//

import UIKit

class AddEventsViewController: UIViewController {
    
    @IBOutlet weak var nameOfEvent: UITextField!
    @IBOutlet weak var inputtedCollege: UITextField!
    @IBOutlet weak var selectedDate: UITextField!
    @IBOutlet weak var descrip: UITextField!
    
    var username: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */

    
   
    
    
    //Get  outlets put into our events database
    //when Done is pressed
    
    @IBAction func putEventFields(sender: AnyObject) {
        
        print("press done")
        
        nameOfEvent.resignFirstResponder()
        inputtedCollege.resignFirstResponder()
        selectedDate.resignFirstResponder()
        descrip.resignFirstResponder()
        
        //Disable the Done button until we are ready
        navigationItem.rightBarButtonItem?.enabled = false
        //Upload a new picture
        //1
        let file = PFObject(className: "event")
            file.saveInBackgroundWithBlock({ (succeeded, error) -> Void in
                if succeeded {
                    //2
                   self.saveEventPost(file)
                } else if let error = error {
                    //3
                    self.showErrorView(error)
                }
                })
        
        
        
    }
    
    func saveEventPost(file: PFObject)
        
    {
        //1
        print ( selectedDate.text);
        let wallPost = EventPost(nameStr: nameOfEvent.text!, collegeStr: inputtedCollege.text!, dateStr: selectedDate.text!, descrip: descrip.text! ,user: PFUser.currentUser()!)
        //2
        wallPost.saveInBackgroundWithBlock{ succeeded, error in
            if succeeded {
                //3
               
                self.navigationController?.popViewControllerAnimated(true)
            } else {
                //4
                if let errorMessage = error?.userInfo["error"] as? String {
                    self.showErrorView(error!)
                }
            }
        }
    }
    
    
    
    
}