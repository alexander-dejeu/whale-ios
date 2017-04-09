//
//  HomeViewController.swift
//  whale-ios-alexanderdejeu
//
//  Created by Alexander Dejeu on 4/7/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  let whaleAPI = WhaleAPI()
  
  @IBOutlet weak var questionCollectionView : UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    questionCollectionView.dataSource = self
    questionCollectionView.register(UINib(nibName: "WhaleQuestionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")

    
    whaleAPI.getAnswers(page: 0, perPage: 2, completionHandler: {
      responseJSON, error, headers  in
      if error == nil{
        
        print(responseJSON)
      }
      else{
        print("prob should give the user some sort of warning")
      }
    })
  }
  
}

extension HomeViewController :  UICollectionViewDataSource {
  func collectionView(_ _collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = _collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! WhaleQuestionCollectionViewCell
    print("mhmm")
  //  cell.answerUserTagline.text = "Hello"
  //  cell.answerUserTagline.textColor = .white
  //  cell.contentView.backgroundColor = .black
    return cell
  }
  
  func collectionView(_ _collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    print("lm")
    return 4
  }
}
