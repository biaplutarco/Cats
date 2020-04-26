//
//  ViewCodeble.swift
//  Cats
//
//  Created by Bia on 25/04/20.
//  Copyright © 2020 akhaten. All rights reserved.

import UIKit

protocol ViewCodable: class {
    
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
}

extension ViewCodable {
    
    func setupView() {
        
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
}
