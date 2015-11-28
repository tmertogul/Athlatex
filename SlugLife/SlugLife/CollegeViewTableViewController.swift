//
//  CollegeViewTableViewController.swift
//  SlugLife
//
//  Created by Daniel Urrutia on 10/8/15.
//  Copyright © 2015 Tim Mertogul. All rights reserved.
//

import UIKit
import EventKit

extension UIView {
    func fadeIn(duration: NSTimeInterval = 1.0, delay: NSTimeInterval = 0.0, completion: ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.alpha = 1.0
            }, completion: completion)  }
    
    func fadeOut(duration: NSTimeInterval = 1.0, delay: NSTimeInterval = 0.0, completion: (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.alpha = 0.0
            }, completion: completion)
    }
}


    class CollegeViewTableViewController: PFQueryTableViewController {
        
        var eventStore = EKEventStore()
        @IBOutlet weak var needPermissionView: UIView!
        @IBOutlet weak var calendarsTableView: UITableView!
        
        

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
            print("view appeared")
            loadObjects()
            
        }
        
        


        
        func checkCalendarAuthorizationStatus(name : String, date : String){
            let status = EKEventStore.authorizationStatusForEntityType(EKEntityType.Event)
            switch (status) {
            case EKAuthorizationStatus.NotDetermined:
                // This happens on first-run
                print("not determined")
                requestAccessToCalendar()
            case EKAuthorizationStatus.Authorized:
                // Things are in line with being able to show the calendars in the table view
                print("authorized")
                
                insertEvent(eventStore,name: name,date: date)
                
                break;
                
            case EKAuthorizationStatus.Restricted, EKAuthorizationStatus.Denied:
                // We need to help them give us permission
                
                let alertController = UIAlertController(title: "Can't add to calendar ", message:
                    " Sluglife needs permission to use your calendar. Please go into settings.", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)

                
                print("restricted")
                requestAccessToCalendar()
                break;
            }
        
        }
        
        func requestAccessToCalendar(){
            eventStore.requestAccessToEntityType(EKEntityType.Event, completion: {
                (accessGranted: Bool, error: NSError?) in
                
                if accessGranted == true {
                    dispatch_async(dispatch_get_main_queue(), {
                        print("here")
                    })
                } else {
                    dispatch_async(dispatch_get_main_queue(), {
                       
                        print("where")
                        //we need permission
                    })
                }
            })
        }
        
        
        func insertEvent(store: EKEventStore, name : String , date: String) {
            // 1
            let calendars = store.calendarsForEntityType(EKEntityType.Event)
                

            
            
            for calendar in calendars {
                // 2
                print (calendar.title)
                if calendar.title == "Calendar" {
                    print("going to save ")
                    // 3
                    let startDate = NSDate()
                    // 2 hours
                    let endDate = startDate.dateByAddingTimeInterval(2 * 60 * 60)
                    
                    // 4
                    // Create Event
                    let event = EKEvent(eventStore: store)
                    event.title = name
                    print (event.title)
                    event.startDate = startDate
                    print(event.startDate)
                    event.endDate = endDate
                    event.calendar = eventStore.defaultCalendarForNewEvents
                    
                    var error: NSError?
                    let result = try! store.saveEvent(event, span: EKSpan.ThisEvent, commit: true)
                    
                    print("saved ")
                    // 5
                    // Save Event in Calendar
      
                }
            }
        }
        
        
        
        
        @IBAction func goToSettingsButtonTapped(sender: UIButton) {
            let openSettingsUrl = NSURL(string: UIApplicationOpenSettingsURLString)
            UIApplication.sharedApplication().openURL(openSettingsUrl!)
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
            let  cell =  tableView.dequeueReusableCellWithIdentifier("EventTableViewCell", forIndexPath: indexPath) as!EventTableViewCell
            
            cell.layoutIfNeeded()
            
            cell.addbutton.tag = indexPath.row
            cell.addbutton.removeTarget(nil, action: nil, forControlEvents: .AllEvents)
            cell.addbutton.addTarget(self, action:"addToCalendar:", forControlEvents:.TouchUpInside)
            
            
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
            cell.Event.text = wallPost.nameStr;
            cell.college.text = wallPost.collegeStr;
            cell.datetime.text = wallPost.dateStr;
            cell.descrip.text = wallPost.descrip;
            
            
            // cell.datetime.text = "Uploaded by: \(wallPost.user.username), \(dateString)"
            
            return cell
        }
        
        
        func addToCalendar(sender: AnyObject) {
            print("pressed button")
            print(sender.tag)
            
            let indexPath = NSIndexPath(forRow: sender.tag, inSection: 0)
            let cell = tableView.cellForRowAtIndexPath(indexPath) as! EventTableViewCell!
            print (cell.Event.text)
            
            //check calendar status
            checkCalendarAuthorizationStatus(cell.Event.text!, date: cell.datetime.text!)
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



