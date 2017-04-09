//
//  WhaleAPI.swift
//  whale-ios-alexanderdejeu
//
//  Created by Alexander Dejeu on 3/22/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import Foundation
import UIKit
import KeychainAccess
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

class WhaleAPI {
  
  let baseURL = URL(string: "https://whale2-elixir.herokuapp.com/api/v1")
  
  func loginUser(email : String, password : String, completionHandler : @escaping (NSDictionary?, Error?, [String: Any]?) -> ()) {
    makeLoginUserCall(email: email, password: password, completionHandler: completionHandler)
  }
  
  func makeLoginUserCall(email : String, password : String,  completionHandler: @escaping (NSDictionary?, Error?, [String: Any]?) -> ()){
    var loginParams : [String : Any] = [:]
    loginParams = ["email" : email, "password" : password]
    let path : whalePaths = .sessions
    let urlString = (baseURL?.absoluteString)! + path.rawValue
    Alamofire.request(urlString, method: .post, parameters : loginParams).responseJSON { response in
      
      print("Response: \(response.response)")
      
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
  
  func getAnswers(page : Int = 0, perPage : Int = 2, completionHandler: @escaping (NSDictionary?, Error?, [String: Any]?) -> ()){
    var answerParams : [String : Any] = [:]
    answerParams = ["Intpage" : page, "per_page" : perPage]
    let path : whalePaths = .answers
    let urlString = (baseURL?.absoluteString)! + path.rawValue
    print(urlString)
    
    var headerParams : HTTPHeaders = [:]
    let keychain = Keychain(service: "whaleAPI")
    let token : String = keychain[string: "auth_token"]!
    headerParams["Authorization"] = token
    headerParams["Accept"] = "application/json"
    
    
    Alamofire.request(urlString, method : .get, parameters : answerParams, headers : headerParams).responseJSON { response in
      print(response.response)
      
      switch response.result {
      case .success(let value):
        print("We should convert to answer objects? ")
        completionHandler(value as? NSDictionary, nil, response.response?.allHeaderFields as! [String : Any]?)
      case .failure(let error):
        completionHandler(nil, error, nil)
      }
      print("Request: \(response.request)")
      
      print("Error: \(response.error)")
      
      }.resume()
  }
}
