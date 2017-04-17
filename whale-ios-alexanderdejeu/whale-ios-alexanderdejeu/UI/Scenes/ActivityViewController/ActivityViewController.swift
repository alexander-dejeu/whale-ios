//
//  ActivityViewController.swift
//  whale-ios-alexanderdejeu
//
//  Created by Alexander Dejeu on 3/29/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import UIKit

class ActivityViewController: UIViewController {
  
  @IBOutlet weak var questionCollectionView : UICollectionView!
  
  let whaleAPI = WhaleAPI()
  var questionsPagedData : PagedData<Question> = PagedData<Question>()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.itemSize = CGSize(width: self.view.frame.width, height: 120)
    flowLayout.minimumLineSpacing = 5.0
    flowLayout.headerReferenceSize = CGSize(width: self.view.frame.width, height: 80.0)
    flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    flowLayout.minimumLineSpacing = 0.0
    
    questionCollectionView.collectionViewLayout = flowLayout
    
    questionCollectionView.dataSource = self
    questionCollectionView.delegate = self
    
    questionCollectionView.register(UINib(nibName: "QuestionCell", bundle: nil), forCellWithReuseIdentifier: "QuestionCell")
    questionCollectionView.register(UINib(nibName: "CustomCollectionViewHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
    
    
    
    whaleAPI.getQuestions(page: 0, perPage: 5, completionHandler: { responseJSON, error, headers  in
      if error == nil {
        if let jsonData = responseJSON?["data"] as? [[String : Any]]{
          self.questionsPagedData.totalPages = (responseJSON?["total_pages"] as? Int)!
          self.questionsPagedData.items = self.whaleAPI.convertJsonToQuestions(json: jsonData)
          self.questionsPagedData.perPage = 5
          self.questionsPagedData.currentPage = 0
        }
        self.questionCollectionView.reloadData()
      }
      else{
        print("prob should give the user some sort of warning")
      }
    })
    
  }
  
  // MARK: - Navigation
  
}

extension ActivityViewController : UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return questionsPagedData.getLoadedItemCount()
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    print("er)")
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestionCell", for: indexPath) as! QuestionCell
    
    let questionObj = questionsPagedData.items[indexPath.item]
    
    cell.userFullName.text = questionObj.sender?.getFullName()
    cell.userQuestion.text = questionObj.content
    
    DispatchQueue.global().async {
      let data = try? Data(contentsOf: URL(string: (questionObj.sender?.profileImageURL!)!)!)
      DispatchQueue.main.async {
        cell.userProfileImage.image = UIImage(data: data!)
      }
    }
//     = questionObj.sender?.getUserProfileImage()
    return cell
  }
  
}

extension ActivityViewController : UICollectionViewDelegate {
  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    if scrollView.frame.height - scrollView.contentOffset.y < 295 * 1.5 {
      print("loade more data")
      self.questionCollectionView.reloadData()
    }
  }
  
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    
    if scrollView.frame.height - scrollView.contentOffset.y < 295 * 1.5 {
      print("loade more data12")
    }
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    
    let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header", for: indexPath) as! CustomCollectionViewHeader
    header.headerLabel.text = "Pending Questions"
    return header
  }
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width : self.view.frame.width, height: 80)
  }
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
    return UIEdgeInsetsMake(0, 0, 0, 0)
  }

}
