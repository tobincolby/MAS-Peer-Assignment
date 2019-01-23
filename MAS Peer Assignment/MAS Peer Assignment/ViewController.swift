//
//  ViewController.swift
//  MAS Peer Assignment
//
//  Created by Colby Tobin on 1/20/19.
//  Copyright © 2019 MAS. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {

    var ref: DatabaseReference!
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func login(_ sender: Any) {
        
        let username: String = usernameText.text as String!
        let password: String = passwordText.text as String!
        
        print(username)
        print(password)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

