import Foundation

class A{
    var a: String
    var b: B?
    
    init(a: String) {
        self.a = a
        print("A is initialized")
    }
    
    deinit {
        print("A deinitialized")
    }
}

class B {
    weak var a: A?
    
    init() {
        print("B is initialized")
        
    }
    
    deinit {
        print("B deinitialized")
    }
}

func test() {
    let a = A(a: "Hello World")
    let b = B()
    
    a.b = b
    b.a = a
}

test()

/// Lazy propoties when it's first accessed, not at initialization
/// Inside the closure, we print self?.message — if self exists, print its message, otherwise print "No message"
class MyClass {
    var msg = "Hello, World!"
    
    lazy var printMsg: () -> Void = { [weak self] in
        print(self?.msg ?? "Unkown message")
    }
    
    deinit {
        print("MyClass is deinitialized")
    }
}

var obj: MyClass? = MyClass()
obj?.printMsg()
obj = nil
