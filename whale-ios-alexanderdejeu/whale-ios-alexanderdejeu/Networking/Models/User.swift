//
//  User.swift
//  whale-ios-alexanderdejeu
//
//  Created by Alexander Dejeu on 4/9/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import Foundation
class User {
  var username : String?
  var lastName : String?
  var profileImageURL : String?
  var id : Int?
  var firstName : String?
  var email : String?
  
  func getFullName() -> String {
    var result = ""
    if firstName != nil{
      result += firstName! + " "
    }
    if lastName != nil{
      result += lastName!
    }
    
    return result.trimmingCharacters(in: .whitespaces)
  }
  
  init(json : [String : Any]){
    guard let username = json["username"] as? String else{
      print("Throw error")
      return
    }
    
    guard let lastName = json["last_name"] as? String else{
      print("Missing lastname")
      return
    }
    
    guard let profileImageURL = json["image_url"] as? String else{
      print("Missing profile image url")
      return
    }
    
    guard let id = json["id"] as? Int else{
      print("Missing id")
      return
    }
    
    guard let firstName = json["first_name"] as? String else{
      print("Missing first name")
      return
    }
    
    guard let email = json["email"] as? String else{
      print("Missing email")
      return
    }
    
    self.username = username
    self.lastName = lastName
    self.profileImageURL = profileImageURL
    self.id = id
    self.firstName = firstName
    self.email = email
  }
  
}
