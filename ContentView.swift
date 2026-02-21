//  ContentView.swift
//  Lab1_Nousheen_Perween

import SwiftUI

struct ContentView: View {
    
    @State private var number = Int.random(in: 1...100)
    @State private var correctCount = 0
    @State private var wrongCount = 0
    @State private var totalAttempts = 0
    @State private var showResult = false
    @State private var isCorrect = false
    @State private var timeRemaining = 5
    @State private var showDialog = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: 35) {
            
            Text("Prime Number Game")
                .font(.largeTitle)
                .bold()
            
            Text("\(number)")
                .font(.system(size: 60))
                .bold()
            
            Text("Time Left: \(timeRemaining)")
                .font(.headline)
                .foregroundColor(timeRemaining <= 2 ? .red : .black)
            
            if showResult {
                Image(systemName: isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .foregroundColor(isCorrect ? .green : .red)
                    .font(.largeTitle)
            }
            
            HStack(spacing: 30) {
                Button("Prime") { checkAnswer(userAnswer: true) }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
    
                Button("Not Prime") { checkAnswer(userAnswer: false) }
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
        }
            
            VStack {
                Text("Correct: \(correctCount)")
                Text("Wrong: \(wrongCount)")
                Text("Attempts: \(totalAttempts)")
            }
            .font(.headline)
        }
        .padding()  
        .background(Color(.systemGray6))
        .onReceive(timer) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                wrongCount += 1
                totalAttempts += 1
                checkDialog()
                generateNewNumber()
            }
        }
        .alert(isPresented: $showDialog) {
            Alert(
                title: Text("10 Attempts Summary"),
                message: Text("You answered:\n\n✅ Correct: \(correctCount)\n❌ Wrong: \(wrongCount)"),
                dismissButton: .default(Text("Continue"))
            )
        }
    }
    
    func checkAnswer(userAnswer: Bool) {
        let correctAnswer = PrimeHelper.isPrime(number)
        
        if userAnswer == correctAnswer {
            correctCount += 1
            isCorrect = true
        } else {
            wrongCount += 1
            isCorrect = false
        }
        
        totalAttempts += 1
        showResult = true
        checkDialog()
        generateNewNumber()
    }
    
    func checkDialog() {
        if totalAttempts % 10 == 0 {
            showDialog = true
        }
    }
    
    func generateNewNumber() {
        number = Int.random(in: 1...100)
        timeRemaining = 5
        showResult = false
    }
}