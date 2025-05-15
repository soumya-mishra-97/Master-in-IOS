import Foundation


// MARK: Extension
/// Add the functionality in existing tupe with out modifying the originals code.
/// Used to orgnaise the code and separate the code

/// String Extension
extension String{
    func uppercaseExtension() -> String {
        return self.uppercased()
    }
    
    func lowercaseExtension() -> String {
        return self.lowercased()
    }
}

var str = "Hello, World!"
print(str.uppercaseExtension())
print(str.lowercaseExtension())

/// Double Extension
extension Double {
    func squareRoot() -> Double {
        return self * self
    }
    
    func celciusToFahrenheit() -> Double {
        return ((self * 1.8000) + 32).rounded()
    }
    
    func fahrenheitToCelcius() -> Double {
        return ((self - 32) / 1.8000).rounded()
    }
}

var num: Double = 4
var celsius: Double = 23
var farenheit: Double = 73

print(num.squareRoot())
print(celsius.celciusToFahrenheit())
print(farenheit.fahrenheitToCelcius())

/// Int Extension
extension Int{
    func add(_ num: Int) -> Int {
        return self + num
    }
}

let number = 3.add(7)
print(number)

/// Date Extension
extension Date {
    func formattedString(format: String = "yyyy-MM-dd HH:mm:ss") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

let currentDate = Date()
print(currentDate.formattedString())
print(currentDate.formattedString(format: "MMM dd, yyyy"))

// MARK: N.B
/// `Stored property in extension`: `Not allowed`
/// `Computed property / Method in extension`: `Allowed`

struct Person {
    var fname: String
    var lName: String
}

extension Person {
    /// Not allowed: Cannot add a stored property
    //var age: Int
    
    /// Allowed: Computed property
    var fullName: String {
        return "\(fname) \(lName)"
    }
    
    /// Allowed: Method
    func greet() -> String {
        return "Hello, my name is \(fullName)."
    }
}

let person1 = Person(fname: "Steven", lName: "Doe")
print(person1.fullName) /// Steven Doe
print(person1.greet()) /// Output: Hello, my name is Steven Doe.

enum Weather{
    case Rainy
    case Sunny
    case Cloudy
}

var weather: Weather = .Rainy
weather = .Sunny
print(weather) 
