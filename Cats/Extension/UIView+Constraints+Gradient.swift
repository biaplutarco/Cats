//
//  UIView+Constraints.swift
//  Cats
//
//  Created by Bia on 25/04/20.
//  Copyright © 2020 akhaten. All rights reserved.

import UIKit

extension UIView {
      
    func fulfillSuperview() {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        guard let superview = self.superview else { return }
        
        NSLayoutConstraint.activate([
            
            self.topAnchor.constraint(equalTo: superview.topAnchor),
            self.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            
            self.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            self.centerXAnchor.constraint(equalTo: superview.centerXAnchor)            
        ])
    }
}
