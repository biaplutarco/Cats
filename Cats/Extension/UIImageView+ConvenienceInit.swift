//
//  UIImageView+GetImageFromPath.swift
//  CustomIcons
//
//  Created by Bia on 27/03/20.
//  Copyright © 2020 akhaten. All rights reserved.
//

import UIKit

extension UIImageView {
    
    convenience init(withCornerRadius cornerRadius: CGFloat) {
        
        self.init()
        
        self.contentMode = .scaleAspectFill
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
    }
}
