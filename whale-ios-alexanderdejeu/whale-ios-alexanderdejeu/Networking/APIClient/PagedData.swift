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
  
  init(totalPages : Int, perPage : Int, currentPage : Int = 0, items : [T]){
    self.totalPages = totalPages
    self.perPage = perPage
    self.currentPage = currentPage
    self.items = items
  }
  
  init(){
    
  }
  
  func getLoadedItemCount() -> Int{
    return perPage * (currentPage + 1)
  }
  
}
