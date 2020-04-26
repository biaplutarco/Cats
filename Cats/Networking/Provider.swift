//
//  Provider.swift
//  Empresas
//
//  Created by Bia on 16/04/20.
//  Copyright © 2020 akhaten. All rights reserved.
//

import UIKit
import Moya
import PromiseKit

protocol JSONSerializable {
    init(with json: [String : Any])
}

class BackpackerProvider<O: Codable, T: TargetType> {

    typealias Output = O
    typealias TargetAPI = T

    private var decoder = JSONDecoder()
    private var provider = MoyaProvider<TargetAPI>()
    
    init() {
        
        self.decoder.dateDecodingStrategy = .customISO8601
    }
    
    func request(_ target: TargetAPI) -> Promise<Output> {
        return Promise<Output> { seal in
            self.provider.request(target, completion: { (response) in
                
                switch response {
                
                case .success(let result):
                    do {
                        
                        let object = try self.decoder.decode(Output.self, from: result.data)
                        
                        return seal.fulfill(object)

                    } catch {
                        
                        return seal.reject(error)
                    }

                case .failure(let error):
                    return seal.reject(error)
                }
            })
        }
    }
}
