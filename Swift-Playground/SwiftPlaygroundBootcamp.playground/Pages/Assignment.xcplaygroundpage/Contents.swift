import UIKit

/// Paalindrome or not
func isPaalindrome(_ input: String) -> Bool {
    let char = Array(input.lowercased())
    var left = 0
    var right = char.count - 1
    
    while left < right {
        if char[left] != char[right]{
            return false
        }
        
        left += 1
        right -= 1
    }
    return true
}
 
print(isPaalindrome("Jyoti"))
print(isPaalindrome("12321"))

/// Singleton Class with Factory
class SingletonClass{
    var msg: String
    
    private init(msg: String) {
        self.msg = msg
    }
    
    static func showMessage() -> SingletonClass {
        return SingletonClass(msg: "Hello")
    }
    
    func showMsg(){
        print(msg)
    }
}

let msg = "Hello"
let singleton = SingletonClass.showMessage()
singleton.showMsg()

/// COW (Copy On Write)
/// Copies the data so the original remains unchanged.
/// Used in collections like Array, Set, Dictionary
var a = [1,2,3]
var b = a /// No copy yet — shared buffer
b.append(4) /// Now copy happens — array2 gets its own buffer
print(a) /// [1, 2, 3]
print(b) /// [1, 2, 3, 4]
