//
//  MyEventsViewController.swift
//  SlugLife
//
//  Created by Daniel Urrutia on 10/12/15.
//  Copyright © 2015 Tim Mertogul. All rights reserved.
//

import UIKit

class MyEventsViewController: UIViewController {
    


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelMyEvents(segue:UIStoryboardSegue) {
        print("here2")
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
