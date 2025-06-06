import UIKit

// MARK: Paalindrome or not
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

// MARK: COW (Copy On Write)
/// Copies the data so the original remains unchanged.
/// Used in collections like Array, Set, Dictionary
var a = [1,2,3]
var b = a /// No copy yet — shared buffer
b.append(4) /// Now copy happens — array2 gets its own buffer
print(a) /// [1, 2, 3]
print(b) /// [1, 2, 3, 4]

// MARK: Singleton
class Singleton {
    /// Shared singleton instance
    static let shared = Singleton()

    /// Private constructor prevents outside initialization
    private init() {}

    func sayHello() {
        print("Hello, World from Singleton!")
    }
}

Singleton.shared.sayHello()

// MARK: Singleton + Factory
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

// MARK: Singleton Design Pattern
/// Singleton used to shared the instance globally and use it across the app
/// You can create the singeton class and access it in multiple files across the app.
/// Thread safety
/// `Use caese`: Used in writing debug logs, capturing info only in debug mode, not interfering with business logic.
/// `Singleton` ensures `only one instance` of the class is `used everywhere`.
///
/// `Factory Constructor:` return an exsiting instance instead of creating one

struct UserInfo{
    var firstName: String
    var lastName: String
}

private var objectUserInfo: UserInfo?

class SingletonUserInfo{
    /// Provides a global, shared access point.
    /// Creates a single, shared instance of the class.
    static let shared = SingletonUserInfo()
    private init() {} /// Prevents external instantication
    
    func getUserInfo() -> UserInfo? {
        return objectUserInfo
    }
    
    func updateUserInfo(_ userInfo: UserInfo) -> (){
        objectUserInfo = userInfo
    }
}

class User{
    func getUser() -> UserInfo? {
        return SingletonUserInfo.shared.getUserInfo()
    }
    
    func updateUser() -> (){
        let newUserInfo = UserInfo(firstName: "John", lastName: "Doe")
        SingletonUserInfo.shared.updateUserInfo(newUserInfo)
    }
}

let user = User()
print(user.getUser() ?? "No User Found")

user.updateUser()

if let userInfo = user.getUser() {
    print("First Name: \(userInfo.firstName)")
    print("Last Name: \(userInfo.lastName)")
} else {
    print("No User Found")
}
