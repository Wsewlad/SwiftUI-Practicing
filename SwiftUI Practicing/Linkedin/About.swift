//
//  About.swift
//  SwiftUI Practicing
//
//  Created by  Vladyslav Fil on 27.10.2020.
//

import SwiftUI

struct About: View {
    var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ProfileSectionHeader(title: "About", action: {  })
            Text(text)
                .font(.subheadline)
        }
        .padding()
    }
}


struct ProfileSectionHeader: View {
    var title: String
    var action: () -> ()
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .fontWeight(.regular)
            Spacer()
            PencilEditButton(action: { action() } )
        }
    }
}


struct About_Previews: PreviewProvider {
    static var previews: some View {
        About(text: "Test text")
    }
}
