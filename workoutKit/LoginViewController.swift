//
//  LoginViewController.swift
//  workoutKit
//
//  Created by Attaullah Azim on 03/08/2016.
//  Copyright © 2016 Attaullah Azim. All rights reserved.
//

import UIKit
import GoogleSignIn

class LoginViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {

    @IBOutlet var anonymousButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // anonymousButton:
        // set border color and width
        anonymousButton.layer.borderWidth = 2.0
        anonymousButton.layer.borderColor = UIColor.orangeColor().CGColor
        googleButton.layer.borderWidth = 2.0
        googleButton.layer.borderColor = UIColor.orangeColor().CGColor
        GIDSignIn.sharedInstance().clientID = "1000120603661-u5umbifo6421fhbkkdmj9o5lpvp68diq.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func loginAnonymouslyDidTapped(sender: AnyObject) {
        
        print("login anonymously did tapped")
        // anonymously log users in
        // switch view by setting navigation controller as root view controller
        Helper.helper.loginAnonymously()
        
        
    }
    
    @IBAction func googleLoginDidTapped(sender: AnyObject) {
        print("google login did tapped")
        
        GIDSignIn.sharedInstance().signIn()
        
    }
    
    @IBAction func signUpDidTapped(sender: AnyObject) {
        Helper.helper.signUpAsNewUser()
    }
    
    
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!, withError error: NSError!) {
        
        if error != nil {
            print(error!.localizedDescription)
            return
        }
        
        
        print(user.authentication)
        Helper.helper.logInWithGoogle(user.authentication)
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
