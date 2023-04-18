//
//  ContentView.swift
//  diagrams
//
//  Created by Anna Nosyk on 18/04/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var pickerItem = 0
    var body: some View {
      
            ZStack {
                Color("background").edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Analytics").font(.system(size: 30, weight: .semibold, design: .monospaced))
                    Picker(selection: $pickerItem, label:
                            Text("")) {
                        Text("2021")
                        Text("2022")
                        Text("2023")
                    }.pickerStyle(.segmented).padding(.horizontal, 16)
                    HStack() {
                        DiagramView()
                        DiagramView()
                        DiagramView()
                    }
                  
                  
                }
            }
    }
}


struct DiagramView: View {
    var body: some View  {
        VStack {
            ZStack(alignment: .bottom) {
                Rectangle().frame(width: 20, height: 300).foregroundColor(Color.white)
                Rectangle().frame(width: 20, height: 200).foregroundColor(Color("firstItemColor"))
            }.padding(.top, 16)
            Text("11").padding(.top, 4)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
