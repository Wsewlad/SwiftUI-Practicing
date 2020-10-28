//
//  Dashboard.swift
//  SwiftUI Practicing
//
//  Created by  Vladyslav Fil on 28.10.2020.
//

import SwiftUI

struct Dashboard: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Your Dashboard")
                        .font(.headline)
                        .fontWeight(.regular)
                    Text("Private to you")
                        .font(.caption)
                        .italic()
                        .foregroundColor(.gray)
                }
                Spacer()
                Button(
                    action: {},
                    label: {
                        HStack {
                            Image(systemName: "star.circle")
                            Text("ALL-STAR")
                        }
                        .foregroundColor(.init(UIColor.darkGray))
                    })
            }
            .padding(.top, 10)
            
            let gridItems = [GridItem](repeating: .init(.flexible(), spacing: -1), count: 3)
            
            LazyVGrid(columns: gridItems) {
                NavigationLink(
                    destination: Text("Who viewed your profile")) {
                    DashboardSummaryItem(
                        summaryInfo: 57,
                        description: "Who viewed your profile")}
                NavigationLink(
                    destination: Text("Article views")) {
                    DashboardSummaryItem(
                        summaryInfo: 0,
                        description: "Article views")}
                NavigationLink(
                    destination: Text("Search appearances")) {
                    DashboardSummaryItem(
                        summaryInfo: 23,
                        description: "Search appearances")}
            }
            .padding(.horizontal, -5)
            
            NavigationLink(
                destination: Text("Saved posts"),
                label: {
                    HStack(alignment: .top, spacing: 20) {
                        Image(systemName: "bookmark")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 25)
                            .foregroundColor(.init(UIColor.darkGray))
                        
                        VStack(alignment: .leading) {
                            Text("Saved posts")
                                .foregroundColor(.black)
                            Text("Save interesting articles and jobs for later")
                                .font(.callout)
                                .foregroundColor(.gray)
                                .lineLimit(nil)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    .border(Color.init(UIColor.systemGray2), width: 1)
                    .background(Color.white)
                    .padding(.horizontal, -5)
                })
            
            
        }
        .padding([.horizontal, .bottom])
        .background(Color.init(UIColor.quaternarySystemFill))
    }
}

//MARK: - Need to fix description alignment

struct DashboardSummaryItem: View {
    var summaryInfo: Int
    var description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 1.0) {
            Text("\(summaryInfo)")
                .bold()
            Text(description)
                .font(.caption)
                .foregroundColor(.init(UIColor.darkGray))
                .frame(maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity)
        .padding(10)
        .border(Color.init(UIColor.systemGray2), width: 1)
        .background(Color.white)
    }
}


struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
