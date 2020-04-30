//
//  PBHitsListViewModel.swift
//  ENBDPixabay
//
//  Created by Vishnu Vardhan Reddy G on 29/04/20.
//  Copyright © 2020 Vishnu. All rights reserved.
//

import Foundation

class PBHitsListViewModel {
    
    var onShouldOpenHitDetails: ((PBHit) -> Void)?
    var onShouldRefreshItems: (() -> Void)?
    var onShouldStartLoadingItems: ((Bool) -> Void)?
    var onShouldShowError: ((String) -> Void)?
    
    var hitsList: [PBHit]
    var fetchingMore: Bool = false
    
    private var currentPage: Int
    private var searchQuery: String
    private var isNewQuery: Bool
    
    init(hitsList:[PBHit]? = nil) {
        
        if let list = hitsList {
            
            self.hitsList = list
        } else {
            self.hitsList = []
        }
        self.currentPage = 0
        self.searchQuery = "apple"
        self.isNewQuery = false
    }
    
    func fetchNextSetofHits() {
        
        self.currentPage += 1
        self.fetchingMore = true
        
        self.onShouldStartLoadingItems?(self.isNewQuery)
        
        let networkManager = PBNetworkManager()
        networkManager.getNewHits(page: self.currentPage, query: self.searchQuery) { (hits, error) in
            
            if error == nil, let hits = hits {
                
                self.hitsList.append(contentsOf: hits)
            }else{
                
                self.currentPage -= 1
                if let error = error {
                    
                    self.onShouldShowError?(error)
                }
            }
            self.fetchingMore = false
            self.isNewQuery = false
            self.onShouldRefreshItems?()

        }
    }
    
    func fetchNewSet(query: String) {
        
        self.currentPage = 0
        self.hitsList = []
        self.searchQuery = query
        self.isNewQuery = true
        
        self.fetchNextSetofHits()
    }
    
    func performActionWith(hit: PBHit) {

        self.onShouldOpenHitDetails?(hit)
    }
}
