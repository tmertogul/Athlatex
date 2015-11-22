//
//  StudentViewTableController.swift
//  SlugLife
//
//  Created by CDuran on 11/19/15.
//  Copyright © 2015 Tim Mertogul. All rights reserved.
//

import Foundation
import UIKit

class StudentViewTableViewController: PFQueryTableViewController {
    
    
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
    
    var queryString = "updatedAt"
    
    
    @IBAction func segmentedControlChanged(sender: AnyObject) {
        
        if(segmentedControl.selectedSegmentIndex == 0){
            print ("her4")
            queryString = "updatedAt"
            self.loadObjects()
            self.tableView.reloadData()
        }
        else  if (segmentedControl.selectedSegmentIndex == 1) {
            queryString = "dateStr"
            self.loadObjects()
            self.tableView.reloadData()
        }
        else  if (segmentedControl.selectedSegmentIndex == 2) {
            queryString = "collegeStr"
            self.loadObjects()
            self.tableView.reloadData()
        }
        
    }
    
    override func queryForTable() -> PFQuery {
        
        
        let query = PFQuery(className: "EventPost")
        
        query.addAscendingOrder(queryString)
        return query
    }
    
    
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject!) -> PFTableViewCell? {
        
        //print("goes here2")
        let  cell =  tableView.dequeueReusableCellWithIdentifier("StudentEventsCell", forIndexPath: indexPath) as!StudentEventsCell
        
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
        _ = dateFormatter.stringFromDate(creationDate!)
        
        
        //let username = wallPost.user.username
        cell.Title.text = wallPost.nameStr;
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
    
}