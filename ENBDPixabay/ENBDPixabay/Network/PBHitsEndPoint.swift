//
//  PBHitsEndPoint.swift
//  ENBDPixabay
//
//  Created by Vishnu Vardhan Reddy G on 30/04/20.
//  Copyright © 2020 Vishnu. All rights reserved.
//

import Foundation

protocol EndPointType {
    
    var baseURL: URL { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}

public enum HitsApi {
    
    case newHitsList(page:Int, query:String)
    case hitDetails(id:Int)
}

extension HitsApi: EndPointType {
    
    var baseURL: URL {
        guard let url = URL(string: "https://pixabay.com/api/") else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .newHitsList(let page, let query):
            let newQuery:String = query.replacingOccurrences(of: " ", with: "+")
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: ["page":page,
                                                      "q":newQuery,
                                                      "key":PBNetworkManager.PixabayAPIKey,
                                                      "image_type":"photo"])
        default:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}


