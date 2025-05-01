import Foundation

/// MARK: Tight Coupling vs Loose Couplinhg

/// MARK: - Tight Coupling Example in Swift (Violation of SOLID)

/// Engine is a base class
class Engine {
    func start() {
        print("Engine started")
    }
}

/// GasEngine is a subclass of Engine
class GasEngine: Engine {
    override func start() {
        print("Gas Engine started")
    }
}

/// Car directly depends on a concrete Engine (tight coupling)
class Car {
    private let engine = Engine() // Directly instantiates a specific engine type
    
    func start() {
        engine.start()
    }
}

// Usage
let audi = Car()
audi.start()

/*
Tight Coupling Problems:
- Cannot use GasEngine, ElectricEngine, or MockEngine without changing Car's internal logic.
- Not testable or extendable without modifying existing code.

Violates SOLID principles:
1. Open/Closed Principle (OCP): Car is not open for extension without modification.
2. Dependency Inversion Principle (DIP): Car depends on a concrete class, not an abstraction.
*/

/// MARK: - Loose Coupling Example in Swift (SOLID-compliant)

/// Engine protocol defines an abstraction
protocol Engine {
    func start()
}

/// Concrete implementation: GasEngine
class GasEngine: Engine {
    func start() {
        print("Gas Engine started")
    }
}

/// Concrete implementation: ElectricEngine
class ElectricEngine: Engine {
    func start() {
        print("Electric Engine started")
    }
}

/// Car depends on abstraction (Engine), not on specific implementations
class Car {
    private let engine: Engine
    
    init(engine: Engine) {
        self.engine = engine
    }
    
    func start() {
        engine.start()
    }
}

let audi = Car(engine: GasEngine())
let tesla = Car(engine: ElectricEngine())

audi.start()   /// Gas Engine started
tesla.start()  /// Electric Engine started

/*
 - Dependency Inversion Principle (DIP)
   - Car depends on an abstraction (Engine protocol), not a concrete class.
 - Open/Closed Principle (OCP)
   - You can add new engine types (e.g., HybridEngine) without modifying the Car class.
 - Reusability
   - Car works with any engine that conforms to Engine, making it easily extensible.
*/

