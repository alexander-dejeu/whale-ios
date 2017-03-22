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
    if (whaleAPI.loginUser(email: emailTextField.text!, password: passwordTextField.text!) != nil){
      self.performSegue(withIdentifier: "SegueFromLoginToHome", sender: nil)
    }
    print("No good login - yikes")
  }
  
  // MARK: - Navigation
  
  
}
