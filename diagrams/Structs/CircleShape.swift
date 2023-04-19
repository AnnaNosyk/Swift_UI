//
//  CircleShape.swift
//  diagrams
//
//  Created by Anna Nosyk on 18/04/2023.
//

import SwiftUI

struct CircleShape: Shape {
    
    let progress: Double
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                    radius: rect.width/2,
                    startAngle: .radians(1.5 * .pi),
                    endAngle: .init(radians: 2 * Double.pi * progress + 1.5 * Double.pi),
                    clockwise: false)
        return path
    }
 
}
