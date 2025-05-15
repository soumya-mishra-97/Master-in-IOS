import Foundation

// MARK: - Tight Coupling vs Loose Coupling

// MARK: - Tight Coupling Example in Swift (Violation of SOLID)

/// Engine is a base class
class Enginee {
    func start() {
        print("Engine started")
    }
}

/// GasEngine is a subclass of Engine
class GasEngine: Enginee {
    override func start() {
        print("Gas Engine started")
    }
}

/// Car directly depends on a concrete Engine (tight coupling)
class TightlyCoupledCar {
    private let engine = Enginee() // Directly instantiates a specific engine type

    func start() {
        engine.start()
    }
}

let tightCar = TightlyCoupledCar()
tightCar.start()

/*
Tight Coupling Problems:
- Cannot use GasEngine, ElectricEngine, or MockEngine without changing Car's internal logic.
- Not testable or extendable without modifying existing code.

Violates SOLID principles:
1. Open/Closed Principle (OCP): Car is not open for extension without modification.
2. Dependency Inversion Principle (DIP): Car depends on a concrete class, not an abstraction.
*/


// MARK: - Loose Coupling Example in Swift (SOLID-compliant)

/// Engine protocol defines an abstraction
protocol Engine {
    func start()
}

/// Concrete implementation: GasEngine
class LooselyCoupledGasEngine: Engine {
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
class LooselyCoupledCar {
    private let engine: Engine

    init(engine: Engine) {
        self.engine = engine
    }

    func start() {
        engine.start()
    }
}

// Usage
let gasCar = LooselyCoupledCar(engine: LooselyCoupledGasEngine())
let electricCar = LooselyCoupledCar(engine: ElectricEngine())

gasCar.start()       // Gas Engine started
electricCar.start()  // Electric Engine started

/*
Benefits:
- Dependency Inversion Principle (DIP): Car depends on an abstraction (Engine protocol), not a concrete class.
- Open/Closed Principle (OCP): You can add new engine types (e.g., HybridEngine) without modifying the Car class.
- Reusability and Testability: Car works with any engine that conforms to Engine, making it easily extensible and mockable.
*/
