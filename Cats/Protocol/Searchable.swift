//
//  Searchable.swift
//  Cats
//
//  Created by Bia on 25/04/20.
//  Copyright © 2020 akhaten. All rights reserved.

import UIKit

protocol Searchable { }

extension Searchable {
    
    func searchForCats(completionHandler: @escaping ([ImagePage]?, Error?)-> Void) {
        
        let provider = BackpackerProvider<Gallery, SessionAPI>()

        provider.request(.search(forWord: "cats")).done { response in
            
            completionHandler(response.data, nil)
        }.catch { error in
            
            completionHandler(nil, error)
        }

    }
}
