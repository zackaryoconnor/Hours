//
//  SceneDelegate.swift
//  Hours
//
//  Created by Zackary O'Connor on 2/5/20.
//  Copyright © 2020 Zackary O'Connor. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UINavigationController(rootViewController: HomeController())
            self.window = window
            window.makeKeyAndVisible()
        }
    }

}

