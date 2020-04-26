//
//  ControllerViewModel.swift
//  CustomIcons
//
//  Created by Bia on 27/03/20.
//  Copyright © 2020 akhaten. All rights reserved.
//

import UIKit

struct ControllerViewModel {
    
    var title: String = "Cats"
    
    var boundsWidth: CGFloat?
             
    func getCatsViewModel() -> CatsViewModel {
        
        if let width = boundsWidth {
            let size = CGSize(width: (width - 30)/2, height: (width - 30)/2)
            let viewModel = CatsViewModel(withCellSize: size)
            
            return viewModel
        } else {
            
            let viewModel = CatsViewModel(withCellSize: CGSize(width: 10, height: 10))
            
            return viewModel
        }
    }
}
