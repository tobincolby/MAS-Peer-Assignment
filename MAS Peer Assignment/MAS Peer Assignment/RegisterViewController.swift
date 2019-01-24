//
//  RegisterViewController.swift
//  MAS Peer Assignment
//
//  Created by Colby Tobin on 1/22/19.
//  Copyright © 2019 MAS. All rights reserved.
//

import UIKit
import FirebaseDatabase
import CoreLocation

class RegisterViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationMgr = CLLocationManager()
    var ref: DatabaseReference!
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var confirmPassText: UITextField!
    var location: CLLocation?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()

        // Do any additional setup after loading the view.
    }

    @IBAction func registerUser(_ sender: Any) {
    
        let status  = CLLocationManager.authorizationStatus()
        
        // 2
        if status == .notDetermined {
            locationMgr.requestWhenInUseAuthorization()
            return
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
        locationMgr.delegate = self
        locationMgr.startUpdatingLocation()
        let username: String = usernameText.text as! String
        let password: String = passwordText.text as! String
        let confirmPass: String = confirmPassText.text as! String
        
        let latitude = location!.coordinate.latitude
        let longitude = location!.coordinate.longitude
        
        
        
        
        print(username)
        print(password)
        print(confirmPass)
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
