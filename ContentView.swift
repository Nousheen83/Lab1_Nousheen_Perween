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
        VStack(spacing: 30) {
            
            Text("Is this number Prime?")
                .font(.title)
            
            Text("\(number)")
                .font(.largeTitle)
                .bold()
            
            Text("Time: \(timeRemaining)")
                .font(.headline)
            
            if showResult {
                Image(systemName: isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .foregroundColor(isCorrect ? .green : .red)
                    .font(.largeTitle)
            }
            
            HStack(spacing: 40) {
                Button("Prime") {
                    checkAnswer(userAnswer: true)
                }
                
                Button("Not Prime") {
                    checkAnswer(userAnswer: false)
                }
            }
            
            Text("Attempts: \(totalAttempts)")
                .font(.headline)
        }
        .padding()
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
                title: Text("Results after 10 Attempts"),
                message: Text("Correct: \(correctCount)\nWrong: \(wrongCount)"),
                dismissButton: .default(Text("OK"))
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