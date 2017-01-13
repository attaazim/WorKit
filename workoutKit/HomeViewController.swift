//
//  FirstViewController.swift
//  workoutKit
//
//  Created by Attaullah Azim on 29/07/2016.
//  Copyright © 2016 Attaullah Azim. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var Tableview: UITableView!
    
    var about = ["Name", "Gender", "Type of Workout", "Bio"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.about.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let myCell: TextInputTableView = self.Tableview.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as! TextInputTableView
        
//        print("my cell is \(cell)")
        
        myCell.configure("", placeholder: "\(self.about[indexPath.row])")
        
        return myCell
    }

    
    @IBAction func didTappedLogOut(sender: AnyObject) {
        // create a main storyboard instance
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // from main storyboard instantiate a view controller
        let logInVC = storyboard.instantiateViewControllerWithIdentifier("LoginVC") as! LoginViewController
        
        // get app delegate
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // set Login view controller as root view controller
        appDelegate.window?.rootViewController = logInVC
        
        print("ONE")
    }
    
    
    
    
    
    

}
