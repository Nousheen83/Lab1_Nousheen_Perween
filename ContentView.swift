import SwiftUI

struct ContentView: View {
    
    @State private var number = Int.random(in: 1...100)
    @State private var correctCount = 0
    @State private var wrongCount = 0
    @State private var showResult = false
    @State private var isCorrect = false
    
    var body: some View {
        VStack(spacing: 30) {
            
            Text("Is this number Prime?")
                .font(.title)
            
            Text("\(number)")
                .font(.largeTitle)
                .bold()
            
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
        }
        .padding()
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
        
        showResult = true
        number = Int.random(in: 1...100)
    }
}