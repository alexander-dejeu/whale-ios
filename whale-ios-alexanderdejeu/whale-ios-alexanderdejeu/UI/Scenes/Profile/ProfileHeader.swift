//
//  ProfileHeader.swift
//  whale-ios-alexanderdejeu
//
//  Created by Alexander Dejeu on 3/22/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import UIKit

@IBDesignable
class ProfileHeader: UIView {
  
  @IBOutlet var contentView: UIView!
  @IBOutlet weak var profileImageView: UIImageView!
  
  @IBOutlet weak var fullNameLabel: UILabel!
  @IBOutlet weak var followersButton: UIButton!
  @IBOutlet weak var followingButton: UIButton!
  
  @IBOutlet weak var userBioLabel: UILabel!
  @IBOutlet weak var userAsksLabel: UILabel!
  @IBOutlet weak var askQuestionButton: UIButton!
  @IBOutlet weak var followUserButton: UIButton!
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    let view = Bundle.main.loadNibNamed("ProfileHeader", owner: self, options: nil)?[0] as! UIView
//    self.addSubview(view)
    self.addSubview(view)
//    view.frame = self.bounds
    view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    
    
    
  }
  
}
