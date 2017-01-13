//
//  ProfileTableViewController.swift
//  workoutKit
//
//  Created by Attaullah Azim on 25/08/2016.
//  Copyright © 2016 Attaullah Azim. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class ProfileTableViewController: UITableViewController {
    
    var about = ["Name", "Gender", "Type of Workout", "Bio"]
    var ref = FIRDatabase.database().reference()
    
    var user = FIRAuth.auth()?.currentUser
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = FIRDatabase.database().reference()
        
        
        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    @IBAction func didTapSave(sender: AnyObject) {
        
        var index = 0
        
        while index < about.count {
            
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
            let cell: TextInputTableView? = self.tableView.cellForRowAtIndexPath(indexPath) as!TextInputTableView
            
            if cell?.myTextField.text != "" {
                
                let item:String = (cell?.myTextField.text!)!
                
                switch about[index] {
                case "Name":
                    self.ref.child("user_profile").child("\(user!.uid)/name").setValue(item)
                    break
                    
                case "Gender":
                    self.ref.child("user_profile").child("\(user!.uid)/gender").setValue(item)
                    break
                    
                case "Type of Workout":
                    self.ref.child("user_profile").child("\(user!.uid)/type_of_workout").setValue(item)
                    break
                    
                case "Bio":
                    self.ref.child("user_profile").child("\(user!.uid)/bio").setValue(item)
                    break
                    
                default:
                    print("Don't save")
                }
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return about.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let myCell: TextInputTableView = tableView.dequeueReusableCellWithIdentifier("TextInput", forIndexPath: indexPath) as! TextInputTableView
         
         //        print("my cell is \(cell)")
         
         myCell.configure("", placeholder: "\(about[indexPath.row])")
         
         return myCell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
