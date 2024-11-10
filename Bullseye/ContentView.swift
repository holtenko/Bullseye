//
//  ContentView.swift
//  Bullseye
//
//  Created by holtenko on 2024/11/9.
//

import SwiftUI

struct ContentView: View {
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0
    @State var target: Int = Int.random(in: 1 ... 100)
    @State var score: Int = 0
    @State var round: Int = 1
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                HStack {
                    Text("Put the bullseye as close as you can to:")
                    Text("\(self.target)")
                }
                Spacer()
                HStack {
                    Text("1")
                    Slider(value: self.$sliderValue, in: 1 ... 100)
                    Text("100")
                }
                Spacer()
                Button(action: {
                    self.alertIsVisible = true

                }) {
                    Text("Hit me!")
                }.alert(isPresented: self.$alertIsVisible) {
                    Alert(title: Text(alertTitle()),
                          message: Text("The slider's value is \(Int(self.sliderValue.rounded())).\n" +
                              "The target value is \(self.target).\n" +
                              "You scored \(pointsForCurrentRound()) points this round."),
                          dismissButton: .default(Text("Awesome!")) {
                              self.score = self.score + self.pointsForCurrentRound()
                              self.target = Int.random(in: 1 ... 100)
                              self.round = self.round + 1
                          })
                }
                Spacer()
                HStack {
                    Button(action: {
                        self.round = 1
                        self.score = 0
                        self.sliderValue = 50
                        self.target = Int.random(in: 1 ... 100)
                    }) {
                        Text("Start over")
                    }
                    Spacer()
                    Text("Score:")
                    Text("\(self.score)")
                    Spacer()
                    Text("Round")
                    Text("\(self.round)")
                    Spacer()
                    NavigationLink(destination: AboutView()) {
                        Text("Info")
                    }
                }
                .padding(.bottom, 20)
            }
        }
        .navigationViewStyle(.stack)
    }

    func pointsForCurrentRound() -> Int {
        let maximumScore = 100
        let difference: Int
        difference = abs(Int(sliderValue.rounded()) - target)
        let bonus: Int
        if difference == 0 {
            bonus = 100
        } else if difference == 1 {
            bonus = 50
        } else {
            bonus = 0
        }
        return maximumScore - difference + bonus
    }

    func alertTitle() -> String {
        let difference: Int = abs(Int(sliderValue.rounded()) - target)
        if difference == 0 {
            return "Perfect!"
        } else if difference < 5 {
            return "You almost had it!"
        } else if difference <= 10 {
            return "Not bad"
        } else {
            return "Are you even trying!"
        }
    }
}

#Preview {
    ContentView()
}
