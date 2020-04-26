//
//  Gallery.swift
//  Cats
//
//  Created by Bia on 25/04/20.
//  Copyright © 2020 akhaten. All rights reserved.
//

//"data": [
//{
//    "id": "U5uE8OV",
//    "title": "My Cat Stormy",
//    "link": "https://imgur.com/a/U5uE8OV",
//    "images": [
//        {
//            "link": "https://i.imgur.com/bXZDpGZ.jpg"
//        }
//    ]
//}
//]

import Foundation

struct Gallery: Codable {
    
    var data: [ImagePage]?
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
           
        self.data = try values.decode([ImagePage]?.self, forKey: .data)
    }
}

struct ImagePage: Codable {
    var images: [Image]?
    
    enum CodingKeys: String, CodingKey {
        case images
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
           
        self.images = try values.decode([Image]?.self, forKey: .images)
    }
}

struct Image: Codable {
    
    var path: String?
    
    enum CodingKeys: String, CodingKey {
        case path = "link"
    }
    
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//
//        self.path = try values.decode(String?.self, forKey: .path)
//    }
}
