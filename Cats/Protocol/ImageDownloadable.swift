//
//  ImageDownloadable.swift
//  Cats
//
//  Created by Bia on 25/04/20.
//  Copyright © 2020 akhaten. All rights reserved.

import UIKit

protocol ImageDownloadable { }

extension ImageDownloadable {
    
    func downloadImage(withPath imagePath: String?, completion: @escaping (_ image: UIImage?, _ error: Error?) -> Void) {
        
        guard let imagePath = imagePath else { return }
        
        guard let url = URL(string: imagePath) else { return }
        
        let imageCache = NSCache<NSString, UIImage>()

        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
           
            completion(cachedImage, nil)
        
        } else {
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let error = error {
                    completion(nil, error)
                    
                } else if let data = data,
                    let image = UIImage(data: data) {
                    
                    imageCache.setObject(image, forKey: url.absoluteString as NSString)
                    
                    completion(image, nil)
                
                } else {
                   
                    completion(nil, error)
                }
            }
            
            DispatchQueue.global(qos: .background).async {
                
                task.resume()
            }
            
        }
    }
    
    static func downloadImage(url: URL, completion: @escaping (_ image: UIImage?, _ error: Error? ) -> Void) {
       
        let imageCache = NSCache<NSString, UIImage>()

        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
           
            completion(cachedImage, nil)
        
        } else {
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let error = error {
                    completion(nil, error)
                    
                } else if let data = data, let image = UIImage(data: data) {
                    
                    imageCache.setObject(image, forKey: url.absoluteString as NSString)
                    
                    completion(image, nil)
                
                } else {
                   
                    completion(nil, error)
                }
            }
            
            DispatchQueue.global(qos: .background).async {
                
                task.resume()
            }
            
        }
    }
}
