//
//  ViewController.swift
//  MAS Peer Assignment
//
//  Created by Colby Tobin on 1/20/19.
//  Copyright © 2019 MAS. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate {

    var ref: DatabaseReference!
    let masterUsername: String = "master"
    let masterPass: String = "pass1234"
    let locationMgr = CLLocationManager()
    var location: CLLocation?

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        errorLabel.text = ""
        let status  = CLLocationManager.authorizationStatus()
        
        locationMgr.delegate = self
        // 2
        if status == .notDetermined {
            locationMgr.requestWhenInUseAuthorization()
        }
        
        // 3
        if status == .denied || status == .restricted {
            let alert = UIAlertController(title: "Location Services Disabled", message: "Please enable Location Services in Settings", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            
            present(alert, animated: true, completion: nil)
            return
        }
        
        // 4
        if CLLocationManager.locationServicesEnabled() {
            locationMgr.startUpdatingLocation()
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func login(_ sender: Any) {
        
        let username: String = usernameText.text as String!
        let password: String = passwordText.text as String!

        
        Auth.auth().signIn(withEmail: username, password: password) { (user, error) in
            // ...
            if let error = error {
                print(error)
                self.errorLabel.text = "Wrong username or password. Please try again."
                print("Wrong username or password. Please try again")
                return
            } else {
            
                guard let userID = user?.uid else {
                    print("This failed")
                    self.errorLabel.text = "Wrong username or password. Please try again."
                    print("Wrong username or password. Please try again")
                    return
                }
                
                let latitude = self.location?.coordinate.latitude ?? 0.0
                let longitude = self.location?.coordinate.longitude ?? 0.0
                
                self.ref.child("users").child(userID).setValue(["latitude": latitude, "longitude": longitude])
                print("Hi")
                self.performSegue(withIdentifier: "loginUser", sender: nil)
            }
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let currentLocation = locations.last!
        location = currentLocation
        print("Current location: \(currentLocation)")
    }
    
    // 2
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

