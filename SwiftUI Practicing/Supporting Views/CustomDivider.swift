//
//  CustomDivider.swift
//  SwiftUI Practicing
//
//  Created by  Vladyslav Fil on 26.10.2020.
//

import SwiftUI

struct CustomDivider: View {
    var color: UIColor = .systemFill
    var height: CGFloat = 10
    
    var body: some View {
        Rectangle()
            .fill(Color.init(color))
            .frame(height: height)
    }
}

struct CustomDivider_Previews: PreviewProvider {
    static var previews: some View {
        CustomDivider()
    }
}
