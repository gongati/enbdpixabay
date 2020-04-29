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
    
    var hitsList: [PBHit]
    
    private var currentPage: Int
    
    init() {
        
        self.hitsList = []
        self.currentPage = 0
    }
    
    func loadHits() {
        
        
    }

}
