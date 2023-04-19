//
//  DiagramView.swift
//  diagrams
//
//  Created by Anna Nosyk on 18/04/2023.
//

import SwiftUI

struct DiagramView: View {
    var value: CGFloat
    private var color: Color {
        if value < 100 {
            return Color("thirdItemColor")
        } else if value > 100 && value < 170 {
            return Color("secondItemColor")
        }else {
            return Color("firstItemColor")
            
        }
    }
    var body: some View  {
        VStack {
            ZStack(alignment: .bottom) {
                Rectangle().frame(width: 50, height: 200).foregroundColor(Color("backgroundSecond"))
                Rectangle().frame(width: 50, height: value).foregroundColor(color)
            }.padding(.top, 16)
            Text(String(format: "%.0f", value)).padding(.top, 4)
        }.padding(24)
    }
}
