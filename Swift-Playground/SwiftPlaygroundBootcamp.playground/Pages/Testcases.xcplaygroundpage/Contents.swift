import Foundation
// MARK: - Testcases

// MARK: - Singleton Design Testcases
class SettingsManager {
    static let shared = SettingsManager()
    private init() { }
    
    var isDarkModeEnabled: Bool = false
    
    func toggleDarkMode() {
        isDarkModeEnabled.toggle()
    }
    
    func reset() {
        isDarkModeEnabled = false
    }
}

/// Test cases for Singleton
import XCTest
/// @testable import YourAppModule

class SettingsManagerTests: XCTestCase {

    override func setUp() {
        super.setUp()
        /// Reset singleton state before each test
        SettingsManager.shared.reset()
    }

    override func tearDown() {
        /// Optional cleanup after each test
        SettingsManager.shared.reset()
        super.tearDown()
    }

    func testDefaultState() {
        XCTAssertFalse(SettingsManager.shared.isDarkModeEnabled, "Dark mode should be off by default")
    }

    func testToggleDarkMode() {
        SettingsManager.shared.toggleDarkMode()
        XCTAssertTrue(SettingsManager.shared.isDarkModeEnabled, "Dark mode should be enabled after toggling")
        
        SettingsManager.shared.toggleDarkMode()
        XCTAssertFalse(SettingsManager.shared.isDarkModeEnabled, "Dark mode should be disabled after toggling again")
    }
}

// MARK: - Interview Questions - ANZ Bank
enum DayTime {
    case morning
    case afternoon
    case evening
    case night
}

class WelcomeMessageGenerator {

    private let date: Date
    init(date: Date = Date()) {
        self.date = date
    }

    private var dayTime: DayTime {
        let hour = Calendar.current.component(.hour, from: date)
        switch hour {
        case 5..<12: return .morning
        case 12..<17: return .afternoon
        case 17..<21: return .evening
        default: return .night
        }
    }

    func getGreeting() -> String {
        switch dayTime {
        case .morning:
            return "Good Morning"
        case .afternoon:
            return "Good Afternoon"
        case .evening:
            return "Good Evening"
        case .night:
            return "Good Night"
        }
    }
}


import XCTest
///@testable import YourAppModule

class WelcomeMessageGeneratorTests: XCTestCase {

    func testMorningGreeting() {
        // 1. Simulate 9:00 AM
        let components = DateComponents(hour: 9)
        let testDate = Calendar.current.date(from: components)!
        let generator = WelcomeMessageGenerator(date: testDate)

        // 2. Check result
        let greeting = generator.getGreeting()
        XCTAssertEqual(greeting, "Good Morning")
    }

    func testAfternoonGreeting() {
        let testDate = Calendar.current.date(from: DateComponents(hour: 14))!
        let generator = WelcomeMessageGenerator(date: testDate)
        XCTAssertEqual(generator.getGreeting(), "Good Afternoon")
    }

    func testEveningGreeting() {
        let testDate = Calendar.current.date(from: DateComponents(hour: 18))!
        let generator = WelcomeMessageGenerator(date: testDate)
        XCTAssertEqual(generator.getGreeting(), "Good Evening")
    }

    func testNightGreeting() {
        let testDate = Calendar.current.date(from: DateComponents(hour: 23))!
        let generator = WelcomeMessageGenerator(date: testDate)
        XCTAssertEqual(generator.getGreeting(), "Good Night")
    }

    func testLateNightGreeting() {
        let testDate = Calendar.current.date(from: DateComponents(hour: 2))!
        let generator = WelcomeMessageGenerator(date: testDate)
        XCTAssertEqual(generator.getGreeting(), "Good Night")
    }
}

// MARK: - API Testcases
/// Define a Protocol
protocol URLSessionProtocol {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

/// Extend URLSession
extension URLSession: URLSessionProtocol {}

/// API Client with DI
class APIClient {
    private let session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func fetchUser(completion: @escaping (Result<String, Error>) -> Void) {
        let url = URL(string: "https://example.com/user")!
        let request = URLRequest(url: url)
        
        Task {
            do {
                let (data, _) = try await session.data(for: request)
                let name = String(data: data, encoding: .utf8) ?? ""
                completion(.success(name))
            } catch {
                completion(.failure(error))
            }
        }
    }
}

/// Mock Session
class MockURLSession: URLSessionProtocol {
    var data: Data?
    var error: Error?

    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        if let error = error {
            throw error
        }
        return (data ?? Data(), URLResponse())
    }
}

import XCTest
/// @testable import YourApp

class APIClientTests: XCTestCase {

    func testFetchUserSuccess() {
        let mockSession = MockURLSession()
        mockSession.data = "John Doe".data(using: .utf8)
        let client = APIClient(session: mockSession)
        
        let expectation = self.expectation(description: "API call should succeed")
        
        client.fetchUser { result in
            switch result {
            case .success(let name):
                XCTAssertEqual(name, "John Doe")
            case .failure:
                XCTFail("Expected success")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 2)
    }

    func testFetchUserFailure() {
        let mockSession = MockURLSession()
        mockSession.error = URLError(.notConnectedToInternet)
        let client = APIClient(session: mockSession)
        
        let expectation = self.expectation(description: "API call should fail")
        
        client.fetchUser { result in
            switch result {
            case .success:
                XCTFail("Expected failure")
            case .failure(let error):
                XCTAssertNotNil(error)
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 2)
    }
}
