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
        [ 50, 130, 120 ],
        [ 20, 70, 200 ],
        [ 190, 20, 60 ]
    
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
                        CircleView(value: 0.4)
                        CircleView(value: 0.5)
                        CircleView(value: 0.7)
                    }.padding(.top, 16)
                    HStack() {
                        DiagramView(value: diagramValues[pickerItem][0])
                        DiagramView(value: diagramValues[pickerItem][1])
                        DiagramView(value: diagramValues[pickerItem][2])
                    }.padding(.top, 16)
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
