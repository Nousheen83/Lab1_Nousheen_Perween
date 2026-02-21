//Prime helper file to check if a number is prime or not

import Foundation

struct PrimeHelper {
    
    static func isPrime(_ num: Int) -> Bool {
        if num <= 1 { return false }
        if num <= 3 { return true }
        
        for i in 2...Int(sqrt(Double(num))) {
            if num % i == 0 {
                return false
            }
        }
        return true
    }
}