//
//  PBHitsService.swift
//  ENBDPixabay
//
//  Created by Vishnu Vardhan Reddy G on 29/04/20.
//  Copyright © 2020 Vishnu. All rights reserved.
//

import Foundation

enum Either<A, B> {
    
    case Left(A)
    case Right(B)
}

class PBHitsService {
    
    typealias PBHitsResult = Either<NSError, PBHitsResponse>
    typealias PBHitsResultHandler = (PBHitsResult)->()

    // MARK: - getHits
    open func getHits(_ queue: DispatchQueue = DispatchQueue.main
        , completion: @escaping PBHitsResultHandler) {
        
    }
}

struct PBConstants {
    
    // MARK: - API Keys
    struct APIKeys {
        
        static let key = "16278338-eb12e56d05bc277bfdae14509"
    }
    
    // MARK: - URL config
    struct URL {
        
        static let baseURL = "https://pixabay.com/api/"
    }

}
