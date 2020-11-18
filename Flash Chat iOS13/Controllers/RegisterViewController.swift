//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        // if email is not null and password is not null, then continue with Auth
        if let email = emailTextfield.text, let password = passwordTextfield.text{
            // we get back authResult and error if there is any
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error { // if there is an error, print the error
                    let msgToUser = e.localizedDescription // allows the language of the user is using
                    
                    // pop up for the error message
                    let alertController = UIAlertController(title: "Unable to register", message: msgToUser, preferredStyle: UIAlertController.Style.alert)
                    alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alertController, animated: false, completion: nil)
                } else {
                    // if successfully registered a user, navigate to the ChatViewController
                    self.performSegue(withIdentifier: K.registerSegue, sender: self) // origin is self (RegisterViewController)
                }
            }
        }
    }
    
}
