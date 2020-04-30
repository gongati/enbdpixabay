//
//  PBHitDetailsViewModel.swift
//  ENBDPixabay
//
//  Created by Vishnu Vardhan Reddy G on 29/04/20.
//  Copyright © 2020 Vishnu. All rights reserved.
//

import Foundation

class PBHitDetailsViewModel {
    
    private var hit: PBHit
    
    init(hit: PBHit) {
        
        self.hit = hit
    }
    
    var pageTitle: String {
    
        return self.hit.tags ?? ""
    }
    
    var likes: Int {
        
        return self.hit.likes ?? 0
    }
    
    var favs: Int {
        
        return self.hit.favorites ?? 0
    }
    
    var comments: Int {
        
        return self.hit.comments ?? 0
    }
    
    var image: String {
        
        return self.hit.largeImageURL ?? ""
    }
}
