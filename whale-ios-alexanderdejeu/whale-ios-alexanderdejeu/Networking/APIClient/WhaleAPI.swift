//
//  WhaleAPI.swift
//  whale-ios-alexanderdejeu
//
//  Created by Alexander Dejeu on 3/22/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

//enum httpMethods : String{
//  case get = "GET"
//  case post = "POST"
//}

enum whalePaths : String {
  case users = "/users"
  case sessions = "/sessions"
  case answers = "/answers"
  case answerComments = "/answers/**answer_id**/comments"
  case answerLikes = "/answers/**answer_id**/likes"
  case answerUpload = "/questions/**question_id**/answers"
  case questions = "/questions"
}

class User{
  
}

class WhaleAPI {
  
  let baseURL = URL(string: "https://whale2-elixir.herokuapp.com/api/v1")
  
  func loginUser(email : String, password : String, completionHandler : @escaping (NSDictionary?, Error?) -> ()) {
    makeLoginUserCall(email: email, password: password, completionHandler: completionHandler)
  }
  
  func makeLoginUserCall(email : String, password : String,  completionHandler: @escaping (NSDictionary?, Error?) -> ()){
    var loginParams : [String : Any] = [:]
    loginParams = ["email" : email, "password" : password]
    Alamofire.request("https://whale2-elixir.herokuapp.com/api/v1/sessions", method: .post, parameters : loginParams).responseJSON { response in
      
      switch response.result{
      case .success(let value):
        completionHandler(value as? NSDictionary, nil)
      case .failure(let error):
        completionHandler(nil, error)
      }
      print("Request: \(response.request)")
      print("Response: \(response.response)")
      print("Error: \(response.error)")
      
      if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
        print("Data: \(utf8Text)")
      }
      else{
        
      }
    }.resume()
  }
}
