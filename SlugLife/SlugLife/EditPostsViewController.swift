//
//  EditPostsViewController.swift
//  SlugLife
//
//  Created by Daniel Urrutia on 11/2/15.
//  Copyright © 2015 Tim Mertogul. All rights reserved.
//

import UIKit

class EditPostsViewController: UIViewController , UITextFieldDelegate{
    var objectIdPassed = String()

    @IBOutlet weak var editName: UITextField!
    
    @IBOutlet weak var editCollege: UITextField!
    @IBOutlet weak var editDate: UITextField!
    @IBOutlet weak var editDesc: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do_query()
        editName.delegate = self // Replace TextField with the name of your textField
        
        editName.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        print("here")

        // Do any additional setup after loading the view.
    }
    
    func textFieldDidChange(textField: UITextField) {
        //your code
        print("going in here")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func do_query(){
        print("got object")
        print(objectIdPassed)
        let query = PFQuery(className: "EventPost")
        query.getObjectInBackgroundWithId(objectIdPassed) {
            (eventPost: PFObject?, error: NSError?) -> Void in
            if error == nil && eventPost != nil {
                print(eventPost?.objectForKey("nameStr"))
                self.editName.text = (eventPost?.objectForKey("nameStr") as! String)
                self.editCollege.text = (eventPost?.objectForKey("collegeStr") as! String)
                self.editDate.text = (eventPost?.objectForKey("dateStr") as! String)
                self.editDesc.text = (eventPost?.objectForKey("descrip") as! String)
                
                print (self.editName.text )
            } else {
                print(error)
            }
        }
    }
    
    @IBAction func putEventFields(sender: AnyObject) {
         print("press done")
        //navigationItem.rightBarButtonItem?.enabled = false
        self.navigationController?.popViewControllerAnimated(true)
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
