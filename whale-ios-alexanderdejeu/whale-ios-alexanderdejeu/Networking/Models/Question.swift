//
//  Question.swift
//  whale-ios-alexanderdejeu
//
//  Created by Alexander Dejeu on 4/9/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import Foundation
class Question {
  var sender : User?
  var receiver : User?
  var id : Int?
  var content : String?
  
  init(json : [String : Any]){
    guard let sender = User(json: json["sender"] as! [String : Any]) as? User else {
      print("Sender failed")
      return
    }
    
    guard let receiver = User(json: json["receiver"] as! [String : Any]) as? User else{
      print("Receiver failed")
      return
    }
    
    guard let id = json["id"] as? Int else{
      print("ID failed")
      return
    }
    
    guard let content = json["content"] as? String else{
      print("Content failed")
      return
    }
    
    self.sender = sender
    self.receiver = receiver
    self.id = id
    self.content = content
  }
  
}
