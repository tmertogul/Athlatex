//
//  AddEventsViewController.swift
//  SlugLife
//
//  Created by Daniel Urrutia on 10/13/15.
//  Copyright © 2015 Tim Mertogul. All rights reserved.
//

import UIKit

class AddEventsViewController: UIViewController {

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
    
    @IBOutlet weak var selectedDate: UITextField!
    @IBOutlet weak var mydatepicker: UIDatePicker!

}
