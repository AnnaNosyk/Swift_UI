//
//  Diagram.swift
//  diagrams
//
//  Created by Anna Nosyk on 19/04/2023.
//

import SwiftUI

struct Diagram: View {
    @ObservedObject var dataObject = DataContainer()
    @State private var indexOfTaped = -1
    var body: some View {
        ZStack {
            Color("background").edgesIgnoringSafeArea(.all)
            VStack {
                Text("Analytics").font(.system(size: 30, weight: .semibold, design: .monospaced))
                circleView.frame(width: 100, height: 200)
                    .onAppear() {
                        self.dataObject.calcPath()
                    }
                list.padding(8).frame(width: 300, alignment: .trailing)
            }
        }
    }
}

struct Diagram_Previews: PreviewProvider {
    static var previews: some View {
        Diagram()
    }
}

extension Diagram {
    private var circleView : some View {
        ZStack {
            ForEach(0..<dataObject.data.count) { index in
                Circle().trim(from: index == 0 ? 0.0 : dataObject.data[index - 1].value/100, to: dataObject.data[index].value/100).stroke(dataObject.data[index].color,lineWidth: 100).scaleEffect(index == indexOfTaped ? 1.1 : 1.0).animation(.spring())
            }
        }
    }
    
    private var list : some View {
        ForEach(0..<dataObject.data.count) {index in
            HStack {
                Text(String(format: "%.2f", Double(dataObject.data[index].percent)) + "%")
                    .onTapGesture {
                        indexOfTaped = indexOfTaped == index ? -1 : index
                    }
                    .font(indexOfTaped == index ? .headline : .subheadline)
                RoundedRectangle(cornerRadius: 3)
                    .fill(dataObject.data[index].color).frame(width: 20, height: 20)
            }
        }
    }
}
