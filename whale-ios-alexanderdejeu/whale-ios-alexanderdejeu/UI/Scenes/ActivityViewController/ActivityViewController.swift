//
//  ActivityViewController.swift
//  whale-ios-alexanderdejeu
//
//  Created by Alexander Dejeu on 3/29/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import UIKit

class ActivityViewController: UIViewController {
  
  let whaleAPI = WhaleAPI()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    whaleAPI.getQuestions(page: 0, perPage: 5, completionHandler: { responseJSON, error, headers  in
      if error == nil {
        var questionData : [Question] = []
        if let jsonData = responseJSON?["data"] as? [[String : Any]]{
          for item in jsonData{
            print("item 1: \(item)")
            questionData.append(Question(json: item))
          }
          
        }
        print(questionData)
//        self.questionCollectionView.reloadData()
        
      }
      else{
        print("prob should give the user some sort of warning")
      }
    })
    
  }
  
  
  // MARK: - Navigation
  
}
