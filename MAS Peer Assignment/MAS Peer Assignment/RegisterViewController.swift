//
//  RegisterViewController.swift
//  MAS Peer Assignment
//
//  Created by Colby Tobin on 1/22/19.
//  Copyright © 2019 MAS. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    var ref: DatabaseReference!
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var confirmPassText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
        

        // Do any additional setup after loading the view.
    }

    @IBAction func registerUser(_ sender: Any) {
    
        
        let username: String = usernameText.text as! String
        let password: String = passwordText.text as! String
        let confirmPass: String = confirmPassText.text as! String
        
        
        if password != confirmPass {
            let alert = UIAlertController(title: "Error", message: "Passwords Must Match", preferredStyle: UIAlertControllerStyle.alert)
            let action = UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        Auth.auth().createUser(withEmail: username, password: password) { (authResult, error) in
            // ...
            print(authResult)
            print(error)
            if error != nil {
                let alert = UIAlertController(title: "Error", message: "Error Registering", preferredStyle: UIAlertControllerStyle.alert)
                let action = UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.cancel, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            guard let user = authResult else { return }
            let alert = UIAlertController(title: "Success", message: "Registered", preferredStyle: UIAlertControllerStyle.alert)
            let action = UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)

            self.performSegue(withIdentifier: "goHome", sender: nil)
            
            
        }
        
        print(username)
        print(password)
        print(confirmPass)
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
