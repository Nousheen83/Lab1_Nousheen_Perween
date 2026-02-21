import Foundation

struct PrimeHelper {
    
    static func isPrime(_ num: Int) -> Bool {
        if num <= 1 { return false }
        if num == 2 { return true }
        
        for i in 2..<num {
            if num % i == 0 {
                return false
            }
        }
        return true
    }
}