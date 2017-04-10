//
//  WhaleQuestionCollectionViewCell.swift
//  whale-ios-alexanderdejeu
//
//  Created by Alexander Dejeu on 3/27/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import UIKit

class WhaleQuestionCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var cellView : UIView!
  
  @IBOutlet weak var answerUserProfileImageView: UIImageView!
  @IBOutlet weak var answerUserFullnameLabel: UILabel!
  @IBOutlet weak var answerUserTagline: UILabel!
  
  @IBOutlet weak var moreOptionsButton: UIButton!
  
  @IBOutlet weak var questionView: UIView!
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var questionAskerName : UILabel!
  @IBOutlet weak var questionAskerProfileImageView : UIImageView!
  
  @IBOutlet weak var videoDurationLabel : UILabel!
  @IBOutlet weak var videoCostLabel : UILabel!
  @IBOutlet weak var likeCountLabel : UILabel!
  @IBOutlet weak var likeImageView : UIImageView!
  @IBOutlet weak var commentCountLabel : UILabel!
  @IBOutlet weak var commentImageView : UIImageView!
  
  var answer : Answer = Answer(){
    didSet{
      answerUserFullnameLabel.text = answer.question?.receiver?.getFullName()
      answerUserTagline.text = "No user taglines added yet :O"
      questionAskerName.text = answer.question?.sender?.getFullName()
      questionLabel.text = answer.question?.content
      setUserComments()
      setUserLikes()
      
    }
  }
  
  func setUserComments(){
    if answer.commentCount! > 0{
      commentCountLabel.isHidden = false
      commentImageView.isHidden = false
      commentCountLabel.text = "\((answer.commentCount)!)"
    }
    else{
      commentCountLabel.isHidden = true
      commentImageView.isHidden = true
    }
  }
  
  func setUserLikes(){
    if answer.likesCount! > 0{
      likeCountLabel.isHidden = false
      likeImageView.isHidden = false
      likeCountLabel.text = "\((answer.likesCount)!)"
    }
    else{
      likeCountLabel.isHidden = true
      likeImageView.isHidden = true
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    
//    self.addSubview(answerUserTagline)

  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
//    fatalError("init(coder:) has not been implemented")
  }
}
