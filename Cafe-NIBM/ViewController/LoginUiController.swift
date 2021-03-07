//
//  LoginUiController.swift
//  Cafe-NIBM
//
//  Created by Lahiru on 3/6/21.
//  Copyright © 2021 Lahiru. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginUiController: UIViewController {
    
    @IBOutlet weak var txt_email: UITextField!
    @IBOutlet weak var txt_password: UITextField!
    let authentication = Auth.auth()
    override func viewDidLoad() {
        
        super.viewDidLoad()
//        
//        let ref = Database.database().reference()
////        let userid=authResult!.user.uid
//        ref.child("users/").setValue(["uid":"545",
//                                     "phoneNo":"54545","email":"hghjgjhghj"])


        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn_Login(_ sender: UIButton) {
        if let email = txt_email.text , let pass = txt_password.text
        {
            authentication.signIn(withEmail: email, password: pass){AuthResult,ee in
                if  let AuthR = AuthResult
                {
                    self.performSegue(withIdentifier: "Food", sender: self)
                }
                else{

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
