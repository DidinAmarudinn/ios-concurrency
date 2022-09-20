//
//  IOS_concurrencyApp.swift
//  IOS concurrency
//
//  Created by didin amarudin on 19/09/22.
//

import SwiftUI

@main
struct IOS_concurrencyApp: App {
    var body: some Scene {
        WindowGroup {
            UserListView()
                .onAppear {
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                }
        }
    }
}
