//
//  CircleView.swift
//  diagrams
//
//  Created by Anna Nosyk on 18/04/2023.
//

import SwiftUI

struct CircleView: View {
    var value: Double
    private var color: Color {
        if value < 0.4 {
            return Color("thirdItemColor")
        } else if value > 0.4 && value < 0.7 {
            return Color("secondItemColor")
        }else {
            return Color("firstItemColor")
            
        }
    }
    var body: some View  {
        ZStack(alignment: .center) {
            CircleShape(progress: 1).stroke(Color("backgroundSecond"), style: StrokeStyle(lineWidth: 10, lineCap: .butt, lineJoin: .round, miterLimit: 0, dash: [], dashPhase: 0 ))
            CircleShape(progress: value).stroke(color, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round, miterLimit: 0, dash: [], dashPhase: 0 ))
          //  Text(String(value * 100) + "%")
            Text(String(format: "%.0f", (value * 100)) + "%")
        }.padding(16)
    }
}
