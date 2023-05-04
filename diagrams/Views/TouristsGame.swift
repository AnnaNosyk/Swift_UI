//
//  TouristsGame.swift
//  diagrams
//
//  Created by Anna Nosyk on 04/05/2023.
//

import SwiftUI

struct TouristsGame: View {
    @State private var names = ["Sphinx", "Taj Mahal", "Leaning Tower of Pisa", "Milan Cathedral", "Big Ben", "Ayasofya", "Colosseum", "Burj Khalifa", "Notre-Dame de Paris", "Eiffel Tower"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var total = 0
    @State private var showingTotal = false
    @State private var titleTotal = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.gray, .white]), startPoint: .bottom, endPoint: .top)
                .edgesIgnoringSafeArea(.all )
            VStack(spacing: 8) {
                VStack{
                    Text("Where is the picture of...")
                        .foregroundColor(.black)
                        .font(.largeTitle)
                    Text(names[correctAnswer])
                        .foregroundColor(.black)
                        .font(.title)
                        .fontWeight(.black)
                }
                ForEach(0..<3) { num in
                    Button(action: {
                        self.tapped(number: num)
                        self.showingTotal = true
                    }) {
                        Image(self.names[num])
                            .renderingMode(.original)
                            .frame(width: 200, height: 200)
                            .clipShape(Capsule())
                            .overlay(Capsule()
                                .stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                    }
                }
                Text("Total: \(total)")
                    .font(.title2)
                    //Spacer()
            }
        }.alert(isPresented: $showingTotal) {
            Alert(title: Text(titleTotal), message: Text("Total: \(total)"), dismissButton: .default(Text("Continue")){
                self.askQuestion()
            })
        }
       
    }
    func askQuestion() {
        names.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func tapped(number: Int) {
        if number == correctAnswer {
            titleTotal = "Correct answer!"
            total += 1
        } else {
            titleTotal = "Incorrect answer! This is \(names[number])"
            total -= 1
        }
    }
}

struct TouristsGame_Previews: PreviewProvider {
    static var previews: some View {
        TouristsGame()
    }
}
