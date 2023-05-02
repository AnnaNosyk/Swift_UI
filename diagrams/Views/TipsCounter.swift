//
//  TipsCounter.swift
//  diagrams
//
//  Created by Anna Nosyk on 02/05/2023.
//

import SwiftUI

struct TipsCounter: View {
    @ State private var checkAmount = ""
    @ State private var V = "$"
    @ State private var numberOfPeople = 0
    @ State private var tipPercentage = 0
    @State private var isDisabled = true
    @State private var isDisabledButton = false
    
    let tipPer = [0, 5, 10, 15, 20]
    var total: Double {
        let numberOfP = Double(numberOfPeople + 2)
        let tipSelect = Double(tipPer[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelect
        let grandTotal = orderAmount + tipValue
        let amouPerPerson = grandTotal / numberOfP
        return amouPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        TextField("Bill", text: $checkAmount)
                            .frame(width: 45)
                            .keyboardType(.decimalPad)
                            .onChange(of: checkAmount) { newValue in
                                self.isDisabledButton = true
                            }
                        TextField("$", text: $V).disabled(isDisabled)
                        Button("Hide Keyboard") {
                                       UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            self.isDisabledButton = false
                        }.disabled(!isDisabledButton)
                    }
                    Picker("Number of peole", selection: $numberOfPeople) {
                        ForEach(2..<21) {
                            Text("\($0) people")
                        }
                    }
                }
                Section(header:Text("How much tip would you like to leave?").font(.headline)) {
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(0..<tipPer.count) {
                            Text("\(self.tipPer[$0]) %")
                        }
                    }.pickerStyle(.segmented)
                }
                Section(header:Text("The amount per person is..").font(.headline)) {
                    Text("\(total, specifier: "%.0f") $")
                }
            }
            .navigationTitle("Count your tips")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
    }

struct TipsCounter_Previews: PreviewProvider {
    static var previews: some View {
        TipsCounter()
    }
}
