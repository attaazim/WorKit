//
//  TextInputTableView.swift
//  workoutKit
//
//  Created by Attaullah Azim on 25/08/2016.
//  Copyright © 2016 Attaullah Azim. All rights reserved.
//

import UIKit

public class TextInputTableView: UITableViewCell {
    
    
    @IBOutlet weak var myTextField: UITextField!
    
    
    public func configure(text: String?, placeholder: String?) {
        
        self.myTextField.text = text
        self.myTextField.placeholder = placeholder
    }
    
    
    
}
