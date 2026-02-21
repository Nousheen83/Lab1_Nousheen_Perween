import SwiftUI

struct ContentView: View {
    
    @State private var number = Int.random(in: 1...100)
    @State private var correctCount = 0
    @State private var wrongCount = 0
    
    var body: some View {
        VStack(spacing: 30) {
            
            Text("Is this number Prime?")
                .font(.title)
            
            Text("\(number)")
                .font(.largeTitle)
                .bold()
            
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
    } else {
        wrongCount += 1
    }
    
    number = Int.random(in: 1...100)
}
}