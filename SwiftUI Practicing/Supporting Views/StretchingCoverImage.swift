//
//  StretchingCoverImage.swift
//  SwiftUI Practicing
//
//  Created by  Vladyslav Fil on 26.10.2020.
//

import SwiftUI

struct StretchingCoverImage: View {
    var coverImage: Image
    var frameHeight: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                if geometry.frame(in: .global).minY <= 0 {
                    coverImage
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                } else {
                    coverImage
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height + geometry.frame(in: .global).minY)
                        .clipped()
                        .offset(y: -geometry.frame(in: .global).minY)
                }
            }
        }.frame(height: frameHeight)
    }
}

struct StretchingCoverImage_Previews: PreviewProvider {
    static var previews: some View {
        StretchingCoverImage(coverImage: profilesData[0].coverImage, frameHeight: 300)
    }
}
