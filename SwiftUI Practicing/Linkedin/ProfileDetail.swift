//
//  ProfileDetail.swift
//  SwiftUI Practicing
//
//  Created by  Vladyslav Fil on 23.10.2020.
//

import SwiftUI

struct ProfileDetail: View {
    @EnvironmentObject var userData: UserData
    @State var isModal: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    ProfileIntro(profile: userData.profiles[0])
                    CustomDivider()
                    if let aboutInfo = userData.profiles[0].about {
                        About(text: aboutInfo)
                        CustomDivider()
                    }
                    Dashboard()
                    CustomDivider()
                    Experience(data: userData.profiles[0].experience)
                    
                    Spacer()
                }
                .edgesIgnoringSafeArea(.top)
            }
            .navigationBarHidden(true)
        }
    }
}


struct ProfileDetail_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 11", "iPhone 8"], id: \.self) { deviceName in
            ProfileDetail()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        .environmentObject(UserData())
    }
}


