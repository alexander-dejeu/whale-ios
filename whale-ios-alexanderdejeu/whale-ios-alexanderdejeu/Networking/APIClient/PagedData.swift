//
//  PagedData.swift
//  whale-ios-alexanderdejeu
//
//  Created by Alexander Dejeu on 4/9/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import Foundation

class PagedData<T>{
  var totalPages : Int = 0
  var perPage : Int = 0
  var currentPage : Int = 0
  var items : [T] = []
  var closure : (Int, Int, (() -> () )?)? = nil
  
  init(totalPages : Int, perPage : Int, currentPage : Int = 0, items : [T]){
    self.totalPages = totalPages
    self.perPage = perPage
    self.currentPage = currentPage
    self.items = items
  }
  
  init(){
    
  }
  
  func setupPagedData(perPage: Int, currentPage : Int = 0){
//    closure(perPage, currentPage)
  }
  
  func loadNextPage(){
    currentPage += 1
  }
  
  func getLoadedItemCount() -> Int{
    print("perpage = \(perPage)")
    print("page = \(currentPage)")
    return min(perPage * (currentPage + 1), items.count)
  }
  
}
