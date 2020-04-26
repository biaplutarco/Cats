//
//  ResponseError.swift
//  Cats
//
//  Created by Bia on 25/04/20.
//  Copyright © 2020 akhaten. All rights reserved.
//

import Foundation

struct ResponseError: Codable, LocalizedError {
    let status: Int
}
