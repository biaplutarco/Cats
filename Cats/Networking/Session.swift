//
//  Session.swift
//  Empresas
//
//  Created by Bia on 16/04/20.
//  Copyright © 2020 akhaten. All rights reserved.
//

import Foundation
import Moya

enum SessionAPI {
    case search(forWord: String)
}

extension SessionAPI: TargetType {
    
    var baseURL: URL {
        
        return URL(string: "https://api.imgur.com/3/gallery/")!
    }
    
    var path: String {
        
        switch self {
            
        case .search:
            
            return "search/"
        }
    }
    
    var method: Moya.Method {
        
        switch self {
            
        case .search:
            
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        
        switch self {
            
        case .search(let word):
            
            return .requestParameters(parameters: ["q": word], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        
         return ["Authorization" : "Client-ID \(User.current.id)"]
    }
}
