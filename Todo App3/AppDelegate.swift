//
//  AppDelegate.swift
//  Todo App3
//
//  Created by Piyush Nanwani on 10/06/25.
//

import Foundation
import SwiftUI
import FirebaseCore
import FirebaseFirestore


class AppDelegate: NSObject, UIApplicationDelegate {
  var db: FireStore?
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      
    db = Firestore.firestore()
    print("Firebase & Firestore initiliased")

    return true
  }
}
