//
//  SceneDelegate.swift
//  Unik
//
//  Created by Volodymyr Bondar on 08.01.2020.
//  Copyright © 2020 Volodymyr Bondar. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {

    self.window = (scene as? UIWindowScene)
      .map(UIWindow.init)
      .on { $0.makeKeyAndVisible() }
      .on { $0.rootViewController = UIHostingController(rootView: ContentView()) }
  }
}
