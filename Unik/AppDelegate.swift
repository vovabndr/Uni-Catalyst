//
//  AppDelegate.swift
//  Unik
//
//  Created by Volodymyr Bondar on 08.01.2020.
//  Copyright © 2020 Volodymyr Bondar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  // MARK: - UISceneSession Lifecycle

  func application(
    _ application: UIApplication,
    configurationForConnecting connectingSceneSession: UISceneSession,
    options: UIScene.ConnectionOptions
  ) -> UISceneConfiguration {

    UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }
}
