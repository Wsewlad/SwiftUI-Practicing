//
//  ProfileIntro.swift
//  SwiftUI Practicing
//
//  Created by  Vladyslav Fil on 26.10.2020.
//

import SwiftUI

struct ProfileIntro: View {
    var profile: Profile
    @State var editIntro: Bool = false
    @State var activity: ActivityIndicator = .online
    
    var body: some View {
        VStack(alignment: .leading) {
            StretchingCoverImage(
                coverImage: profile.coverImage,
                frameHeight: 150
            )
            
            HStack {
                CircleImageWithActivityIndicator(image: profile.avatarImage, size: 150, activity: $activity)
                Spacer()
                PencilEditButton(action: { activity.toggle() })
                    .offset(y: 25)
            }
            .padding(.leading)
            .padding(.trailing)
            .padding(.bottom, -75)
            .offset(y: -75)
            
            Description(profile: profile)
                .padding(.horizontal)
                .font(.subheadline)
        }
        .padding(.bottom, 10)
    }
}


struct CircleImageWithActivityIndicator: View {
    var image: Image
    var size: CGFloat
    @Binding var activity: ActivityIndicator
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                CircleImage(image: image)
                UserActivityIndicator(currentActivity: activity)
                    .frame(height: geometry.size.height / 5)
                    .overlay(Circle().stroke(Color.white, lineWidth: 3).shadow(radius: 3))
                    .offset(
                        x: geometry.size.height / 2.8,
                        y: geometry.size.width / 1.4
                    )
            }
        }
        .frame(width: size, height: size)
    }
}


struct UserActivityIndicator: View {
    var currentActivity: ActivityIndicator
    
    var body: some View {
        switch currentActivity {
        case .online:
            Circle()
                .fill(Color.green)
        default:
            Circle()
                .strokeBorder(Color.red, lineWidth: 7)
                .background(Circle().foregroundColor(.white))
        }
    }
}


struct PencilEditButton: View {
    var action: () -> ()
    
    var body: some View {
        Button(
            action: { action() },
            label: {
                Image(systemName: "pencil")
                    .font(.system(size: 25, weight: .bold))
            })
    }
}


struct Description: View {
    var profile: Profile
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(profile.fullname)
                .font(.title2)
            Text(profile.headline)
                .font(.headline)
                .fontWeight(.regular)
            
            HStack {
                Text(profile.currentWorkplace)
                if profile.showAboveEducationInMyIntro {
                    Text("·")
                    Text(profile.education)
                }
            }
            
            HStack {
                Text(profile.country)
                Text("·")
                NavigationLink("500+ connections", destination: CircleImage(image: profile.avatarImage))
            }
        }
    }
}

struct ProfileIntro_Previews: PreviewProvider {
    static var previews: some View {
        ProfileIntro(profile: profilesData[0])
    }
}
