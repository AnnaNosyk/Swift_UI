//
//  DiagramView.swift
//  diagrams
//
//  Created by Anna Nosyk on 18/04/2023.
//

import SwiftUI

struct DiagramView: View {
    var value: CGFloat
    var body: some View  {
        VStack {
            ZStack(alignment: .bottom) {
                Rectangle().frame(width: 50, height: 200).foregroundColor(Color.white)
                Rectangle().frame(width: 50, height: value).foregroundColor(Color("firstItemColor"))
            }.padding(.top, 16)
            Text("11").padding(.top, 4)
        }
    }
}
