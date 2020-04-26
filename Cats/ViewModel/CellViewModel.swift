//
//  CellViewModel.swift
//  AirAppsTest
//
//  Created by Bia on 27/03/20.
//  Copyright © 2020 akhaten. All rights reserved.
//

import UIKit

class CellViewModel: ImageDownloadable {
    
    var image: UIImage? {
        didSet {
            reloadImage?()
        }
    }
     
    var reloadImage: (() -> Void)?
    
    init(item: Image) {
        setImage(withPath: item.path)
    }
    
    private func setImage(withPath path: String?) {
        downloadImage(withPath: path) { (image, error) in
            
            if let image = image {
                
                self.image = image
            } else {
            
                print(error?.localizedDescription as Any)
            }
        }
    }
}
