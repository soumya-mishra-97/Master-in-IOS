import Foundation


/// Extension functions used to add the new functionalities in existing type.
/// Add functionality without modifying existing code
/// Code clean
/// Reuse common functions across your app


/// String Extension
extension String{
    var upperCasesString: String{
        self.uppercased()
    }
}

let str = "Swift"
print(str.upperCasesString)

/// Int Extension
extension Int{
    func add(_ num: Int) -> Int {
        return self + num
    }
}

let num = 3.add(7)
print(num)

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

