//
//  LoginViewController.swift
//  whale-ios-alexanderdejeu
//
//  Created by Alexander Dejeu on 3/22/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  
  // MARK : IBOutlets
  @IBOutlet weak var emailTextField : UITextField!
  @IBOutlet weak var passwordTextField : UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  // MARK: - IBActions
  @IBAction func loginButtonPressed(sender: UIButton){
    let whaleAPI = WhaleAPI()
    whaleAPI.loginUser(email: emailTextField.text!, password: passwordTextField.text!) {
      response, error in
      if error == nil{
        print("Need to save to keychain!")
        self.performSegue(withIdentifier: "SegueFromLoginToHome", sender: nil)
      }
      else{
        print("prob should give the user some sort of warning")
      }
     
    }
  }
  
  // MARK: - Navigation
  
  
}
