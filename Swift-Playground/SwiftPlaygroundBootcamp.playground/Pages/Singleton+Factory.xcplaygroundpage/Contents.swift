import UIKit
import Foundation

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
/// `Factory Designpattern:` Create the Objects without exposing instantialion logic.
///  // Thread-safe by default in Swift
struct UserInfo{
    var firstName: String
    var lastName: String
}

private var objectUserInfo: UserInfo?

class SingletonUserInfo{
    /// `static let` is lazily initialized and initialized once only, even when accessed from multiple threads at the same time.
    /// Initialization is handled atomically by the Swift runtime.
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


// MARK: - Factory Design Pattern
/// Control the creation of objects (return existing object)
/// Used for the Abstract object creation means encapsulate complex initialization logic
/// Best for the dependency injection


/// Factory Pattern --- 1
struct Report{
    let id: UUID
    let year: Int
    let total: Double
    
    static func generateDummyReport() -> Array<Report>{
        return [Report(id: UUID(), year: Int.random(in: 2015..<2024), total: Double.random(in: 2000..<5000)),
                Report(id: UUID(), year: Int.random(in: 2015..<2024), total: Double.random(in: 2000..<5000))]
    }
}

protocol ReportProtocol{
    func getReport() -> Array<Report>
}

class TaxReport: ReportProtocol{
    func getReport() -> Array<Report>{
        print("Tax Report Fetching")
        return Report.generateDummyReport()
    }
}

class ProfitReport: ReportProtocol{
    func getReport() -> Array<Report>{
        print("Profit Report Fetching")
        return Report.generateDummyReport()
    }
}

enum ReportType{
    case tax
    case profit
}

class ReportFactory{
    static func create(type: ReportType) -> ReportProtocol{
        switch type{
        case .tax:
            TaxReport()
        case .profit:
            ProfitReport()
        }
    }
}

class ReportViewModel{
    
    private let reportPR: ReportProtocol
    
    init(_report: ReportProtocol){
        reportPR = _report
    }
    
    func getReport() -> Array<Report>{
        let reportFC = ReportFactory.create(type: .tax)
        return reportFC.getReport()
    }
}

let reportVM = ReportViewModel(_report: ReportFactory.create(type: .tax))
reportVM.getReport()

/// Factory Pattern --- 2
protocol Vehicle {
    func start()
}

class Car: Vehicle {
    func start() { print("Car started") }
}

class Bike: Vehicle {
    func start() { print("Bike started") }
}

enum VehicleType {
    case car, bike
}

class VehicleFactory {
    static func create(type: VehicleType) -> Vehicle {
        switch type {
        case .car:
            return Car()
        case .bike:
            return Bike()
        }
    }
}

let vehicle = VehicleFactory.create(type: .bike)
vehicle.start()

