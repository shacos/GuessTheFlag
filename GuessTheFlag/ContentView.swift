//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Mehdi on 1/8/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingAlert = false
    @State private var alertTitle = ""

    var body: some View {
        ZStack {
            RadialGradient(stops: [.init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3), (.init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3))], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
 
            VStack {
                Spacer()

                Text("Guess the flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                Spacer()

                VStack(spacing: 30) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(20)
                .background(.ultraThinMaterial)
                .clipShape(.rect(cornerRadius: 25))
                
                Spacer()
                Spacer()

                Text("Your score is ???")
                    .font(.title.bold())
                    .foregroundStyle(.white)
                
                Spacer()
            }
            .padding()
        }
        .alert(alertTitle, isPresented: $showingAlert) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is ???")
        }
    }
    
    func flagTapped(_ number: Int) {
        if (correctAnswer == number) {
            alertTitle = "Correct"
        } else {
            alertTitle = "Wrong"
        }
        
        showingAlert = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
