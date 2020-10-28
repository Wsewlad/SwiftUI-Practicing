//
//  Experience.swift
//  SwiftUI Practicing
//
//  Created by  Vladyslav Fil on 28.10.2020.
//

import SwiftUI

struct Experience: View {
    var data: [Profile.ExperienceItem]
    
    var body: some View {
        VStack(alignment: .leading) {
            ProfileSectionHeader(title: "Experience", action: {})
            let count = data.count
            ForEach(data.indices) { idx in
                ExperienceRow(info: data[idx], isLastRow: idx == count - 1)
            }
        }
        .padding()
    }
}


struct ExperienceRow: View {
    var info: Profile.ExperienceItem
    var isLastRow: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                NavigationLink(
                    destination: Text(info.companyName),
                    label: { info.companyLogo })
                
                NavigationLink(
                    destination: Text(info.position),
                    label: {
                        VStack(alignment: .leading) {
                            Text(info.position)
                                .font(.headline)
                            Text(info.companyName)
                                .font(.subheadline)
                            Text(info.duration)
                                .font(.callout)
                                .foregroundColor(.gray)
                            if !isLastRow {
                                Divider()
                            }
                        }
                        .foregroundColor(.black)
                    })
            }
            if isLastRow {
                Divider()
            }
        }
    }
}


struct Experience_Previews: PreviewProvider {
    static var previews: some View {
        Experience(data: profilesData[0].experience)
    }
}
