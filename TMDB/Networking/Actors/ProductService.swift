//
//  ProductService.swift
//  Sample MVP
//
//  Created by Bassem Abbas on 9/18/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation
import Moya

//swiftlint:disable  force_unwrapping

enum  ActorsService {
    case popular(page:Int)
    case search(page:Int, query:String)
}

extension ActorsService: TargetType {
    var baseURL: URL {
        return URL(string: NetworkManager.shared.networkConfig.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .popular:
            return "/person/popular"
        case .search:
            return "/search/person"
            
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .popular:
            return .get
        case .search:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .popular:
            return Data()
        case .search:
            return Data()
        }
    }
    
    var task: Task {        
        switch self {
        case .popular(let page) :
            var params: [String: Any] = [:]
            params["api_key"] = NetworkManager.shared.networkConfig.apiKey
            params["page"] = page
            return .requestParameters(
                parameters: params,
                encoding: URLEncoding.default)
            
        case .search(let page, let query) :
            var params: [String: Any] = [:]
            params["api_key"] = NetworkManager.shared.networkConfig.apiKey
            params["query"] = query
            params["page"] = page
            return .requestParameters(
                parameters: params,
                encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}


/*baseUrl = "https://api.themoviedb.org/3/search/person?api_key=3955a9144c79cb1fca10185c95080107&query=\(query.replacingOccurrences(of: " ", with: "%20"))&page="*/
