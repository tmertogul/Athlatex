//
//  CollegeViewTableViewController.swift
//  SlugLife
//
//  Created by Daniel Urrutia on 10/8/15.
//  Copyright © 2015 Tim Mertogul. All rights reserved.
//

import UIKit

    class CollegeViewTableViewController: PFQueryTableViewController {
        
        
        @IBOutlet weak var segmentedControl: UISegmentedControl!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine 
            
            // Do any additional setup after loading the view.
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
        override func viewWillAppear(animated: Bool) {
            loadObjects()
        }
        
        //automatically login as a guest so that we can query database
        
        override func queryForTable() -> PFQuery {
            
           // let curr_user = PFUser.currentUser()
            let query = PFQuery(className: "EventPost")
            
            if(segmentedControl.selectedSegmentIndex == 0){
                return query.addAscendingOrder("updatedAt")
            }
            else  if (segmentedControl.selectedSegmentIndex == 1) {
                return query.addAscendingOrder("dateStr")
            }
            else  if (segmentedControl.selectedSegmentIndex == 2) {
                return query.addAscendingOrder("collegeStr")
            } else {
                print("outofbounds")
                return query
            }
            
            // code to sort by updated at
            //return query.addAscendingOrder("updatedAt")
            //return query
        }
        
        
        override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject!) -> PFTableViewCell? {

            //print("goes here2")
            let  cell =  tableView.dequeueReusableCellWithIdentifier("EventTableViewCell", forIndexPath: indexPath) as!EventTableViewCell
            
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
            cell.descrip.text = wallPost.descrip;
            
            
            // cell.datetime.text = "Uploaded by: \(wallPost.user.username), \(dateString)"
            
            return cell
        }
        

        
        // MARK: - Table view data source
        /*
        
        override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 0
        }
        
        override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return 0
        }
*/
        
        @IBAction func cancelToCollegePickerViewController(segue:UIStoryboardSegue) {
        }
        
        @IBAction func saveCollegePicker(segue:UIStoryboardSegue) {
        }
        
    }



