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
    
    guard let likesCount = json["likes_count"] as? Int else{
      print("likes count failed")
      return
    }
    
    guard let id = json["id"] as? Int else{
      print("id failed")
      return
    }
    
    guard let commentCount = json["comment_count"] as? Int else{
      print("Comment Count failed")
      return
    }
    
    self.videoURL = videoURL
    self.thumbnailURL = thumbnailURL
    self.question = question
    self.likesCount = likesCount
    self.id = id
    self.commentCount = commentCount
  }
}
