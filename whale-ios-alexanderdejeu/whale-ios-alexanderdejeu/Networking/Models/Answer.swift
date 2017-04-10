//
//  Answer.swift
//  whale-ios-alexanderdejeu
//
//  Created by Alexander Dejeu on 4/9/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import Foundation
class Answer {
  var videoURL : String?
  var thumbnailURL : String?
  var question : Question?
  var likesCount : Int?
  var id : Int?
  var commentCount : Int?
  
  init(){
    
  }
  
  init(json : [String : Any]){
    guard let videoURL = json["video_url"] as? String else{
      print("Video URL failed")
      return
    }
    
    guard let thumbnailURL = json["thumbnail_url"] as? String else{
      print("thumbnailURL failed")
      return
    }
    
    guard let question = Question(json: json["question"] as! [String : Any]) as? Question else{
      print("Question failed")
      return
    }
    
    var likesCount = 0
    print(json["likes_count"]!)
    if ((json["likes_count"] as? Int) != nil){
      likesCount = (json["likes_count"] as? Int)!
    }
    
    guard let id = json["id"] as? Int else{
      print("id failed")
      return
    }
    
    var commentCount = 0
    if ((json["comment_count"] as? Int) != nil){
      commentCount = (json["comment_count"] as? Int)!
    }
    
    self.videoURL = videoURL
    self.thumbnailURL = thumbnailURL
    self.question = question
    self.likesCount = likesCount
    self.id = id
    self.commentCount = commentCount
  }
}
