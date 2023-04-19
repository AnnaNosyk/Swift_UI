//
//  ContentView.swift
//  diagrams
//
//  Created by Anna Nosyk on 18/04/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var pickerItem = 0
    @State var diagramValues:[[CGFloat]] = [
        [ 50, 170, 120 ],
        [ 20, 130, 200 ],
        [ 130, 20, 100 ]
    
    ]
    
    @State var circleDiagramValues:[[CGFloat]] = [
        [ 0.1, 0.7, 0.5 ],
        [ 0.2, 0.5, 0.9 ],
        [ 0.3, 0.5, 0.8 ]
    
    ]

    var body: some View {
            ZStack {
                Color("background").edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer(minLength: 100)
                    Text("Analytics").font(.system(size: 30, weight: .semibold, design: .monospaced))
                    Picker(selection: $pickerItem, label:
                            Text("")) {
                        Text("2021").tag(0)
                        Text("2022").tag(1)
                        Text("2023").tag(2)
                    }.pickerStyle(.segmented).padding(.horizontal, 16)
                    HStack {
                        CircleView(value: circleDiagramValues[pickerItem][0])
                        CircleView(value: circleDiagramValues[pickerItem][1])
                        CircleView(value: circleDiagramValues[pickerItem][2])
                    }.padding(.top, 16)
                    HStack {
                        DiagramView(value: diagramValues[pickerItem][0])
                        DiagramView(value: diagramValues[pickerItem][1])
                        DiagramView(value: diagramValues[pickerItem][2])
                    }.padding(.top, 16.0)
                    Spacer(minLength: 100)
                }
            }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
