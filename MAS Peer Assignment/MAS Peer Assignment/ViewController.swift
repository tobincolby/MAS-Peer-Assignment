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
    let masterUsername: String = "master"
    let masterPass: String = "pass1234"
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        errorLabel.text = ""
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func login(_ sender: Any) {
        
        let username: String = usernameText.text as String!
        let password: String = passwordText.text as String!
        if masterUsername == username && masterPass == password {
            self.performSegue(withIdentifier: "loginUser", sender: nil)
        } else {
            errorLabel.text = "Wrong username or password. Please try again."
            print("Wrong username or password. Please try again")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

