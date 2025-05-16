// MARK: - Dependency Injection vs Dependency Inversion
// MARK: - Dependency Injection

/// `DI`: Dependecy has to be injected, and not created inside the class.
/// `DIP`: Dependency ijetced with the help of highest level of abstarction like protocolos
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
