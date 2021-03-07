//
//  RegisterUiViewController.swift
//  Cafe-NIBM
//
//  Created by Lahiru on 3/7/21.
//  Copyright © 2021 Lahiru. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseDatabase

class RegisterUiViewController: UIViewController {
    var firebaseauth=Auth.auth()
    @IBOutlet weak var txt_email: UITextField!
    @IBOutlet weak var txt_phone_no: UITextField!
    @IBOutlet weak var txt_password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn_register(_ sender: UIButton) {
        let phoneNo=txt_phone_no.text;
                if let email = txt_email.text, let password = txt_password.text{
                
                    firebaseauth.createUser(withEmail: email, password: password) { authResult, error in
                    if let errr=error
                    {
                        print(errr)
                    }
                    else
                    {
        //                print("uid \(authResult!.user.uid) email \(email) phoneNo \(phoneNo)")
                        
                         let ref = Database.database().reference()
                        let userid=authResult!.user.uid
                        ref.child("users_details/"+userid).setValue(["user_id":userid,
                                                     "phone_No":phoneNo,"email":email])
                        
                        //                let user = self.auth.currentUser
                        //                var  alert = UIAlertController(title: "user", message: user?.uid, preferredStyle: .alert)
                        //                          self.present(alert, animated: true),phoneNumber

                        
                         self.performSegue(withIdentifier: "Food", sender: self)

    }
                    }
        }
    }
                    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
