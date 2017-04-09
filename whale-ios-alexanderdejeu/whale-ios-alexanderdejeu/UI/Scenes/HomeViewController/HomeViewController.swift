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
  var answersPagedData : PagedData<Answer> = PagedData<Answer>()
  @IBOutlet weak var questionCollectionView : UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    questionCollectionView.dataSource = self
    questionCollectionView.delegate = self
    questionCollectionView.register(UINib(nibName: "WhaleQuestionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
    
    
    
    whaleAPI.getAnswers(page: 0, perPage: 4, completionHandler: {
      responseJSON, error, headers  in
      if error == nil{
        
        print(responseJSON?["data"])
        var answersData : [Answer] = []
        if let jsonData = responseJSON?["data"] as? [[String : Any]]{
          for item in jsonData{
            print("item 1: \(item)")
            answersData.append(Answer(json: item))
          }
          
        }
        self.answersPagedData = PagedData(totalPages: (responseJSON?["total_pages"] as? Int)!, perPage: (responseJSON?["per_page"] as? Int)!, items: answersData)
        
        self.questionCollectionView.reloadData()
        
      }
      else{
        print("prob should give the user some sort of warning")
      }
    })
  }
  
}

extension HomeViewController : UICollectionViewDelegate {
  
  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    if scrollView.frame.height - scrollView.contentOffset.y < 295 * 1.5 {
      print("loade more data")
    }
  }
  
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    
    if scrollView.frame.height - scrollView.contentOffset.y < 295 * 1.5 {
      print("loade more data")
    }
  }
}

extension HomeViewController :  UICollectionViewDataSource {
  func collectionView(_ _collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = _collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! WhaleQuestionCollectionViewCell
  //  cell.answerUserTagline.text = "Hello"
  //  cell.answerUserTagline.textColor = .white
  //  cell.contentView.backgroundColor = .black
    return cell
  }
  
  func collectionView(_ _collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    print("lm")
    return answersPagedData.getLoadedItemCount()
  }
}
