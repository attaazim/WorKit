//
//  SignUpViewController.swift
//  workoutKit
//
//  Created by Attaullah Azim on 07/08/2016.
//  Copyright © 2016 Attaullah Azim. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelDidTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        Helper.helper.logInAsUser()
    }
    
    
    

}
