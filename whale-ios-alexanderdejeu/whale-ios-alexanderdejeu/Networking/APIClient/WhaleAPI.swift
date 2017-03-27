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
  
  func loginUser(email : String, password : String, completionHandler : @escaping (NSDictionary?, Error?, [String: Any]?) -> ()) {
    makeLoginUserCall(email: email, password: password, completionHandler: completionHandler)
  }
  
  func makeLoginUserCall(email : String, password : String,  completionHandler: @escaping (NSDictionary?, Error?, [String: Any]?) -> ()){
    var loginParams : [String : Any] = [:]
    loginParams = ["email" : email, "password" : password]
    Alamofire.request("https://whale2-elixir.herokuapp.com/api/v1/sessions", method: .post, parameters : loginParams).responseJSON { response in
      
      print("Response: \(response.response)")
//      print("Get that good good header \(response.response?.value(forKeyPath: "Authorization"))")
      
      switch response.result {
      case .success(let value):
        completionHandler(value as? NSDictionary, nil, response.response?.allHeaderFields as! [String : Any]?)
      case .failure(let error):
        completionHandler(nil, error, nil)
      }
      print("Request: \(response.request)")
     
      print("Error: \(response.error)")
      
    }.resume()
  }
}
