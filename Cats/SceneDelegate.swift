//
//  SceneDelegate.swift
//  Cats
//
//  Created by Bia on 26/04/20.
//  Copyright © 2020 akhaten. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let viewController = ViewController()
        let navigationController = UINavigationController(rootViewController: viewController)

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        
        self.window = window
    }
}
