//
//  MyEventsViewController.swift
//  SlugLife
//
//  Created by Daniel Urrutia on 10/12/15.
//  Copyright © 2015 Tim Mertogul. All rights reserved.
//

import UIKit

class MyEventsTableViewController: PFQueryTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelAddEvents(segue:UIStoryboardSegue) {
        print("here2")
    }
    
    @IBAction func hitDoneButton(segue:UIStoryboardSegue) {
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
    
    override func viewWillAppear(animated: Bool) {
        loadObjects()
    }
    
    override func queryForTable() -> PFQuery {
        let query = EventPost.query()
        return query!
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject!) -> PFTableViewCell? {
        // 1
        let cell = tableView.dequeueReusableCellWithIdentifier("eventPostCell", forIndexPath: indexPath) as!EventPostTableViewCell
        
        // 2
        let wallPost = object as! EventPost
        
        
        // 4
        let creationDate = wallPost.createdAt
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm dd/MM yyyy"
        let dateString = dateFormatter.stringFromDate(creationDate!)
        
        if let username = wallPost.user.username {
            cell.Event.text = "Uploaded by: \(username), \(dateString)"
        } else {
            cell.college.text = "Uploaded by anonymous: , \(dateString)"
        }
        
        cell.datetime.text = "Uploaded by: \(wallPost.user.username), \(dateString)"
        
        // cell.commentLabel.text = EventPost.comment
        
        return cell
    }
    
    @IBAction func logOutPressed(sender: AnyObject) {
        print("debug logout")
        PFUser.logOut()
        //[self.view.window.rootViewController dismissModalViewControlerAnimated:YES];
       //navigationController?.popToRootViewControllerAnimated(true)
        navigationController?.popToRootViewControllerAnimated(true)
        //navigationController?.popToViewController(viewController: LoginViewController, animated: true)
    }
}
