//
//  NewChatViewController.swift
//  workoutKit
//
//  Created by Attaullah Azim on 13/08/2016.
//  Copyright © 2016 Attaullah Azim. All rights reserved.
//

import UIKit


class NewChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchDisplayDelegate {
    
    var usersArray = [UserItem]()
    var filteredUsers = [UserItem]()
    var selectedUserItem : UserItem?
    var updatedChatsArray = [UserItem]()
    
    
    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.usersArray += [UserItem(name: "Atta")]
        self.usersArray += [UserItem(name: "Amaan")]
        self.usersArray += [UserItem(name: "Danyal")]
        self.usersArray += [UserItem(name: "Zeenat")]
        self.usersArray += [UserItem(name: "Sara")]
        
        self.TableView.reloadData()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (tableView == self.searchDisplayController?.searchResultsTableView) {
            return self.filteredUsers.count
        }
        else {
            return self.usersArray.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.TableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        var user : UserItem
        
        if (tableView == self.searchDisplayController?.searchResultsTableView) {
            user = self.filteredUsers[indexPath.row]
        }
        else {
            user = self.usersArray[indexPath.row]
        }
        
        cell.textLabel?.text = user.name
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        var user : UserItem
        
        if (tableView == self.searchDisplayController?.searchResultsTableView) {
            user = self.filteredUsers[indexPath.row]
        }
        else {
            user = self.usersArray[indexPath.row]
        }
        
        print(user.name)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "NewChatSegue" {
            
            var indexPath : NSIndexPath = self.TableView.indexPathForSelectedRow!
            
            var chatWindowNav = segue.destinationViewController as! UINavigationController
            
            var chatWindowVC = chatWindowNav.viewControllers.first as! ChatViewController
            
            selectedUserItem = self.usersArray[indexPath.row]
            
            print("selected user name is \(selectedUserItem?.name)")
            
            chatWindowVC.recievedUserItem = selectedUserItem
            
        }
        
    }
    
    // MARK: Search
    
    func filterContentForSearchText(searchText: String, scope: String = "Title") {
        self.filteredUsers = self.usersArray.filter({( user : UserItem) -> Bool in
            
            var categoryMatch = (scope == "Title")
            var stringMatch = user.name.rangeOfString(searchText)
            
            return categoryMatch && (stringMatch != nil)
        })
    }
    
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String!) -> Bool {
        
        self.filterContentForSearchText(searchString, scope: "Title")
        
        return true
    }
    
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchScope searchOption: Int) -> Bool {
        
        self.filterContentForSearchText(self.searchDisplayController!.searchBar.text!, scope: "Title")
        
        return true
    }
    
    
    
    


}

