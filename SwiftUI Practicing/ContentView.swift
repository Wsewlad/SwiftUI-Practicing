//
//  ContentView.swift
//  SwiftUI Practicing
//
//  Created by  Vladyslav Fil on 22.10.2020.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Text("Hello")
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 11", "iPhone 8"], id: \.self) { deviceName in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        .environmentObject(UserData())
    }
}
