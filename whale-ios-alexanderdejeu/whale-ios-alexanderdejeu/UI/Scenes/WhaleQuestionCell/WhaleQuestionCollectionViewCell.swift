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
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
//    self.addSubview(answerUserTagline)

  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
//    fatalError("init(coder:) has not been implemented")
  }
}
