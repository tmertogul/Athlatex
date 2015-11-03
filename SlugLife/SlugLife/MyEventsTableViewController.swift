//
//  MyEventsViewController.swift
//  SlugLife
//
//  Created by Daniel Urrutia on 10/12/15.
//  Copyright © 2015 Tim Mertogul. All rights reserved.
//

import UIKit

class MyEventsTableViewController: PFQueryTableViewController {
    var objectIdToPass = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelAddEvents(segue:UIStoryboardSegue) {
        print("cancelAddEvents func in MyEventsTabController")
    }
    
    
    @IBAction func cancelEditEvents(segue:UIStoryboardSegue) {
        print("cancelAddEvents func in MyEventsTabController")
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
        let curr_user_id = PFUser.currentUser()
        let query = EventPost.query()
        query?.whereKey("user", equalTo: curr_user_id!)
        return query!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let row = indexPath.row
        print("Row: \(row)")
        
        
        
        let object = objectAtIndexPath(indexPath) as! EventPost
        self.objectIdToPass = object.objectId!
        print("Here",self.objectIdToPass)
        
        performSegueWithIdentifier("segueToEdit", sender: self)
        
        
        
        
    }
    
    override func prepareForSegue(segue: (UIStoryboardSegue!), sender: AnyObject!) {
        if segue.identifier == "segueToEdit" {
            // Setup new view controller
            let destination = segue.destinationViewController as?  EditPostsViewController
            destination?.objectIdPassed = self.objectIdToPass
            
        }
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject!) -> PFTableViewCell? {
        
        print("goes here")
        
        let  cell =  tableView.dequeueReusableCellWithIdentifier("EventPostTableViewCell", forIndexPath: indexPath) as!EventPostTableViewCell
        
        cell.layoutIfNeeded()
            
        if(indexPath.row % 2 == 0) {
            let backcolor = UIColor(red: 255, green: 255, blue: 255, alpha: 1.0)
            cell.backgroundColor = backcolor
        } else {
            let backcolor = UIColor(red: 255, green: 255, blue: 0, alpha: 0.4)
            cell.backgroundColor = backcolor
        }
        
            // 2
        let wallPost = object as! EventPost
            
        let creationDate = wallPost.createdAt
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm dd/MM yyyy"
        let dateString = dateFormatter.stringFromDate(creationDate!)
            
        
        //let username = wallPost.user.username
        cell.Event.text = wallPost.nameStr;
        cell.college.text = wallPost.collegeStr;
        cell.datetime.text = wallPost.dateStr;
        
        
            
            
           // cell.datetime.text = "Uploaded by: \(wallPost.user.username), \(dateString)"
            
            
            
        
        
        return cell
    }
    
    @IBAction func logOutPressed(sender: AnyObject) {
        print("debug logout")
        PFUser.logOut()
        if(PFUser.currentUser() == nil){
            print("yes logged out")
            
        }
        
        
        
        //[self.view.window.rootViewController dismissModalViewControlerAnimated:YES];
       //navigationController?.popToRootViewControllerAnimated(true)
        //navigationController?.navigationController?.popToRootViewControllerAnimated(true)
    }
}
