// MARK: - Dependency Injection vs Dependency Inversion
// MARK: - Dependency Injection

/// `DI`: Dependecy has to be injetced, and not created inside the class.
/// `DIP`: Dependency injetced with the help of highest level of abstarction like protocolos
/// In `DIP` dependencies are always passed in highest level of abstarction like protocolos

// MARK: - Model
struct User {
    var name: String
    var email: String
}

// MARK: - Protocol (Abstraction)
protocol LoginProtocol {
    func authenticateUser(user: User)
}

// MARK: - Low-Level Module (Concrete implementation)
class LoginAPI: LoginProtocol {
    func authenticateUser(user: User) {
        print("Authenticating user: \(user.name), \(user.email)")
    }
}

// MARK: - High-Level Module
class LoginViewModel {
    private let loginAPI: LoginProtocol

    /// Constructor Injection
    init(loginAPI: LoginProtocol) {
        self.loginAPI = loginAPI
    }

    func authCurrentUser(currentUser: User) {
        loginAPI.authenticateUser(user: currentUser)
    }
}

let api = LoginAPI() 
let viewModel = LoginViewModel(loginAPI: api)

let user = User(name: "John", email: "john@example.com")
viewModel.authCurrentUser(currentUser: user)

// MARK: - Dependecy Inversion Principle
/// Dependency has to be injetced with the help of highest level of abstarction like protocolos

struct Order{
    let amount: Double
    let description: String
    let tax: Double
    let created_by: String
}

protocol OrderStorage{
    func saveOrder(order: Order)
}

/// High level class
class Handler{
    private let _orderStorage: OrderStorage
    
    init(order: OrderStorage){
        _orderStorage = order
    }
    
    func saveOrder(order: Order){
        guard order.amount != 0 else{
            debugPrint("Save Operation Failed, Order amount should be gretter than 0")
            return
        }
        
        _orderStorage.saveOrder(order: order)
    }
}

/// Low level class
class OrderDatabaseOperation: OrderStorage{
    func saveOrder(order: Order) {
        debugPrint("Order \(order.description) of amount \(order.amount) is saved.")
    }
}

class OrderAPIOperation: OrderStorage{
    func saveOrder(order: Order) {
        debugPrint("Order \(order.description) of amount \(order.amount) is saved.")
    }
}

let objectHandler = Handler(order: OrderDatabaseOperation())
objectHandler.saveOrder(order: Order(amount: 100, description: "Test Order", tax: 10, created_by: "John" ))
