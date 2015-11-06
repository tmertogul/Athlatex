//
//  AddEventsViewController.swift
//  SlugLife
//
//  Created by Daniel Urrutia on 10/13/15.
//  Copyright © 2015 Tim Mertogul. All rights reserved.
//

import UIKit

class AddEventsViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    @IBOutlet weak var nameOfEvent: UITextField!
    @IBOutlet weak var inputtedCollege: UITextField!
    @IBOutlet weak var selectedDate: UITextField!
    @IBOutlet weak var descrip: UITextField!
    
    @IBOutlet weak var dateSelected: UILabel!
    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    @IBAction func datePickerAction(sender: AnyObject) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        let strDate = dateFormatter.stringFromDate(myDatePicker.date)
        self.dateSelected.text = strDate
    }

    /*  code to format the date into a string
    @IBOutlet weak var myDatePicker: UIDatePicker!
    @IBOutlet weak var dateSelected: UILabel!
    @IBAction func datePickerAction(sender: AnyObject) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        let strDate = dateFormatter.stringFromDate(myDatePicker.date)
        self.dateSelected.text = strDate
    }*/
    
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
    
    // begin popover code

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDate"
        {
            let vc = segue.destinationViewController
            
            let controller = vc.presentationController
            
            if controller != nil
            {
                controller?.delegate = self
            }
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return.None
    }
    
   
    @IBAction func dateButton(sender: AnyObject) {
        self.performSegueWithIdentifier("showDate", sender: self)
    }

    // end popover code
    
    //Get  outlets put into our events database
    //when Done is pressed
    
    @IBAction func putEventFields(sender: AnyObject) {
        
        print("press done")
        
        nameOfEvent.resignFirstResponder()
        inputtedCollege.resignFirstResponder()
        selectedDate.resignFirstResponder()
        descrip.resignFirstResponder()
        //myDatePicker.resignFirstResponder()
        
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
        let wallPost = EventPost(nameStr: nameOfEvent.text!, collegeStr: inputtedCollege.text!, dateStr: selectedDate.description, descrip: descrip.text!, user: PFUser.currentUser()!)
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