//
//  DataContainer.swift
//  diagrams
//
//  Created by Anna Nosyk on 19/04/2023.
//

import Foundation
import SwiftUI

class DataContainer: ObservableObject {
  @Published  var data = [
    MyData(color: Color("firstItemColor"), percent: 20, value: 0),
    MyData(color: Color("secondItemColor"), percent: 15, value: 0),
    MyData(color: Color("thirdItemColor"), percent: 25, value: 0),
    MyData(color: Color("fourthItemColor"), percent: 35, value: 0),
    MyData(color: Color("fifthItemColor"), percent: 5, value: 0)
    ]
    
    func calcPath() {
        var value: CGFloat = 0
        for index in 0..<data.count {
            value += data[index].percent
            data[index].value = value 
        }
    }
}
