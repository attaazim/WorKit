//
//  Helper.swift
//  workoutKit
//
//  Created by Attaullah Azim on 04/08/2016.
//  Copyright © 2016 Attaullah Azim. All rights reserved.
//

import Foundation
import FirebaseAuth
import GoogleSignIn
import UIKit

class Helper {
    static let helper = Helper()
    
    func loginAnonymously() {
        
        print("login anonymously did tapped")
        // anonymously log users in
        // switch view by setting navigation controller as root view controller
        
        FIRAuth.auth()?.signInAnonymouslyWithCompletion({ (anonymousUser: FIRUser?, error: NSError?) in
            if error == nil {
                print("UserId: \(anonymousUser!.uid)")
                
                self.switchToTabBarViewController()
            }
            else {
                print(error!.localizedDescription)
                return
            }
        })
        
    }
    
    func logInWithGoogle(authentication: GIDAuthentication) {
        
        let credential = FIRGoogleAuthProvider.credentialWithIDToken(authentication.idToken, accessToken: authentication.accessToken)
        FIRAuth.auth()?.signInWithCredential(credential, completion: { (user: FIRUser?, error: NSError?) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            else {
                print(user?.email)
                print(user?.displayName)
                
                self.switchToTabBarViewController()
            }
            
        })
    }
    
    func signUpAsNewUser() {
        self.switchToSignUpViewController()
    }
    
    func logInAsUser() {
        self.switchToLogInViewController()
    }
    
    private func switchToTabBarViewController() {
        // create a main storyboard instance
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // from main stroyboard instantiate a tab bar controller
        let tabBarVC = storyboard.instantiateViewControllerWithIdentifier("TabBarVC") as! UITabBarController
        
        // get app delegate
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // set navigation controller as root view controller
        appDelegate.window?.rootViewController = tabBarVC
    }
    
    private func switchToSignUpViewController() {
        // create a main storyboard instance
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // from main stroyboard instantiate a tab bar controller
        let signUpVC = storyboard.instantiateViewControllerWithIdentifier("SignUpVC") 
        
        // get app delegate
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // set navigation controller as root view controller
        appDelegate.window?.rootViewController = signUpVC
    }
    
    private func switchToLogInViewController() {
        
        // create a main storyboard instance
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // from main stroyboard instantiate a tab bar controller
        let logInVC = storyboard.instantiateViewControllerWithIdentifier("LoginVC")
        
        // get app delegate
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // set navigation controller as root view controller
        appDelegate.window?.rootViewController = logInVC
        
    }
    
}
