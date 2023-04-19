//
//  CircleView.swift
//  diagrams
//
//  Created by Anna Nosyk on 18/04/2023.
//

import SwiftUI

struct CircleView: View {
    var value: Double
    var body: some View  {
        ZStack(alignment: .center) {
            CircleShape(progress: 1).stroke(Color.white, style: StrokeStyle(lineWidth: 10, lineCap: .butt, lineJoin: .round, miterLimit: 0, dash: [], dashPhase: 0 ))
            CircleShape(progress: value).stroke(Color("firstItemColor"), style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round, miterLimit: 0, dash: [], dashPhase: 0 ))
            Text(String(value * 100) + "%")
        }.padding()
    }
}
