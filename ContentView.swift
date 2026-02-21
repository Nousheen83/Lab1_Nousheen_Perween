import SwiftUI

struct ContentView: View {
    
    @State private var number = Int.random(in: 1...100)
    
    var body: some View {
        VStack(spacing: 30) {
            
            Text("Is this number Prime?")
                .font(.title)
            
            Text("\(number)")
                .font(.largeTitle)
                .bold()
            
            HStack(spacing: 40) {
                Button("Prime") {
                    
                }
                
                Button("Not Prime") {
                    
                }
            }
        }
        .padding()
    }
}