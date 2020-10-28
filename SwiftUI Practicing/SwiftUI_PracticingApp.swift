//
//  SwiftUI_PracticingApp.swift
//  SwiftUI Practicing
//
//  Created by  Vladyslav Fil on 22.10.2020.
//

import SwiftUI

@main
struct SwiftUI_PracticingApp: App {
    var userData = UserData()
    
    var body: some Scene {
        WindowGroup {
            ProfileDetail()
                .environmentObject(userData)
        }
    }
}
