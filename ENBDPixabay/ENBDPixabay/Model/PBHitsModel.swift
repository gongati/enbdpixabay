//
//  PBHitsModel.swift
//  ENBDPixabay
//
//  Created by Vishnu Vardhan Reddy G on 29/04/20.
//  Copyright © 2020 Vishnu. All rights reserved.
//

import Foundation

struct PBHitsResponse: Codable {
    
    let total : Int?
    let totalHits : Int?
    let hits : [PBHit]?
}

struct PBHit: Codable {
    
    let id : Int?
    let pageURL : String?
    let type : String?
    let tags : String?
    let previewURL : String?
    let previewWidth : Int?
    let previewHeight : Int?
    let webformatURL : String?
    let webformatWidth : Int?
    let webformatHeight : Int?
    let largeImageURL : String?
    let imageWidth : Int?
    let imageHeight : Int?
    let imageSize : Int?
    let views : Int?
    let downloads : Int?
    let favorites : Int?
    let likes : Int?
    let comments : Int?
    let user_id : Int?
    let user : String?
    let userImageURL : String?
}
