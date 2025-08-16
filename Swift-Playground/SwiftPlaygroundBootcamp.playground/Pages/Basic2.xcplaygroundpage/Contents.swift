import Foundation

/// `Tuples`
/// If you have `multiple separate of data` so `tuples` easily `combined` them and `return` it from a `function`
/// Usecaes: `Data grouping`
let userDetails: (String, Int, Bool) = ("Soumya", 28, true)
print(userDetails.0) /// Soumya
print(userDetails.1) /// 28
print(userDetails.2) /// true

let person: (name: String, age: Int) = ("Bob", 30)
print(person.name) /// Bob
print(person.age) /// 30

func getUserName() -> String{
    return "John"
}

func getUserage() -> Int{
    return 19
}

func isUserAbove18() -> Bool{
    return true
}

func getUserDetails() -> (String, Int, Bool){
    let name = getUserName()
    let age = getUserage()
    let isAbove18 = isUserAbove18()
    
    print("Name: \(name), Age: \(age), isAbove18: \(isAbove18 == true ? "Yes": "No")")
    return (name, age, isAbove18)
}

getUserDetails()

///`Defer Statement`
/// Executed in last
func def1() {
    defer {
        print("2")
        print("-------")
    }
    print("1")
}

def1()

/// `Layered Defer Statement`
func def2() {
    print("1")
    defer {
        print("7")
    }
    print("2")
    defer {
        print("6")
    }
    print("3")
    defer {
        print("5")
    }
    print("8")
    print("4")
}

def2()

/// Generic Types
func doubleVal(_ num: inout Int){
    return num *= 2
}
var n = 5
doubleVal(&n)
print("value of n:\(n)")

/// Swap value
func swapValue<T>(_ a: inout T, _ b: inout T){
    var temp = a
    a = b
    b = temp
}
var a = 15, b = 20
swapValue(&a, &b)
print("Swap value a:\(a), b:\(b)")

/// `Dictionaries`
/// Stored the value as `key-value` pair
/// It's the `value types`
/// `Value types means : if you are changing a varibale then it doesn't imapct another varibale`
/// `it maintains the copies eachother`
/// But `Reference types means : if you are changing a varaible it does impact anaother varibale.`

var dict1: [String: String] = ["Audi": "R8", "BMW": "X3", "Merceedez": "Class-430"]
print(dict1)
print(dict1["Audi"] ?? "Unknown")
dict1["BMW"] = nil
print(dict1)
print(dict1["BMW"] ?? "Unknown")
dict1["BMW"] = "X5"
print(dict1)
print(dict1["BMW"] ?? "Unknown")

/// Value types
var dict2 = dict1
dict2["Merceedez"] = "G-Wagon"
print("Printing merceedez value from dict1 \(dict1["Merceedez"] ?? "Unknown")")
print("Printing merceedez value from dict2 \(dict2["Merceedez"] ?? "Unknown")")

/// `Sets`
/// Collection types also provides the unordered values
/// Maintain the uniqueness like remove the duplicate values from array.
/// Return the `unique data` in collection.
/// `Array` maintained th sequential order but Set doesn't.
/// If you need uniqune data but order isn't mattererd then used `Set`
/// but if you need sequential order with unique data then used `Array with custom coding`

/// `Array doesn't removes the duplicate value and order does matter`
var vegetable: Array = ["Carrot", "Potato", "Onion", "Carrot", "Potato"]
print(vegetable)

/// `Sets removes the duplicate value and order doesn't mattered here`
var fruit1: Set<String> = ["Apple", "Banana", "Orange", "Apple", "Banana"]
print(fruit1)
var fruit2: Set<String> = ["Apple", "Grapes"]
print(fruit2)

var commonFruits = fruit1.intersection(fruit2)
print("Common Fruits: \(commonFruits)")

var differFruits = fruit1.symmetricDifference(fruit2)
print("Different Fruits: \(differFruits)")

/// Custom Object
/// `Hashable`: is a protocol which provides unique hash value of each object
/// `Fast comparision` between objects.
/// Used to stored in Sets
/// Create the custom object and conforms hashable protocol
struct Person: Hashable {
    let name: String
    let age: Int
}

let p1 = Person(name: "Steve", age: 28)
let p2 = Person(name: "Max", age: 28)

let objectPerson: Set<Person> = [p1, p2]

for person in objectPerson {
    print(person)
    print("Name: \(person.name), Age: \(person.age)")
}

/// `Identifiable`: `Automatically handles the ID`
/// Provides the `unique identifier` of each object
/// Used in List and ForEach
/// Avoids the manual id in UI Lits
/// Swift detects id automatically.

struct User: Identifiable {
    let id: UUID /// Automatically handles the ID here
    let name: String
}

let users: [User] = [
    .init(id: UUID(), name: "Alice"),
    .init(id: UUID(), name: "Bob"),
    .init(id: UUID(), name: "Charlie"),
]

for user in users {
    print(user)
    print("Name: \(user.name)")
}

// MARK: map, compactMap, flatMap, filter
/// `map`: Transforms each element in a collection
let num = [2, 4, 6]
let squares = num.map { $0 * $0 }
print(squares)

let arr1 = ["2", "4", "A"]
let mapped = arr1.map {Int($0)}
print(mapped)

/// `compactMap`: Same as map, but removes all nils from the result.
/// Remove the duplicate value
/// Sort the value
/// Remove the nil value
let arr2 = [1, 3, 5, 7, 9, 9, 6, 4, nil, 3, 1, nil]
let removeDuplicate = Array(Set(arr2))
let removeNil = removeDuplicate.compactMap { $0 }
print(removeNil.sorted())

let str = ["1", "2", "A"]
let compacttedMap = str.compactMap{Int($0)}
print(compacttedMap)

/// `Faltmap`: Flatten Nested Structures
/// Used to flatten a collection of collections (e.g., arrays of arrays).
/// Can also transform elements like map, but flattens the result.
let nested = [[1, 2], [3, 4], [5]]
let flattened = nested.flatMap { $0 }
print(flattened)

let values = ["10",nil, "20", "abc", nil]
let result = values.flatMap { $0 } /// So for optional conversion: use compactMap instead of flatMap.
print(result)

let files = [[1, 2], [3, 4], []]
let allFiles = files.flatMap { $0 }
print(allFiles)

/// Reversed String
var str1 = "Hello"
var reversed = ""

for character in str1 {
    reversed = "\(character)" + reversed
}

print("Original: \(str1)")
print("Reversed: \(reversed)")

/// Even number
let arr = [1, 2, 3, 4, 5, 6, 7]
for num in arr where num % 2  == 0 {
    print(num)
}

/// Check whether the two values in the tuple point (x and y) are equal
let point = (x: 2, y: 2)

switch point {
case let (x,y) where x == y:
    print("x and y are equal")
default:
    print("x and y are not equal")
}


/// Sorted Array
func sortedArray(_ a: inout [Int]){
    let count = a.count
    guard count > 1 else {return}
    
    for i in 0..<count{
        for j in 0..<count - i - 1{
            let temp = a[j]
            a[j] = a[j+1]
            a[j+1] = temp
        }
    }
    print(a)
}

var arr3 = [5,4,3,2,1]
sortedArray(&arr3)

for i in 1...3 {
    for j in 1...2 {
        print("i: \(i), j: \(j)")
    }
}

/// Reverse words
func reverseWordsHO(_ sentence: String) -> String {
    return sentence
        .split(separator: " ")
        .reversed()
        .joined(separator: " ")
}

let input = "Swift is awesome"
print(reverseWordsHO(input))

/*
 Form arrayC with all the elements of given arrayA and arrayB. arrayC should not have duplicates and should be sorted in Ascending order.
 let arrayA = [19, 11, 13, 15, 17]
 let arrayB = [19, 13, 17, 23, 29]
  
 Expected output: [11, 13, 15, 17, 19, 23, 29]
 */

let arrayA = [19, 11, 13, 15, 17]
let arrayB = [19, 13, 17, 23, 29]

var arrayC = Set(arrayA + arrayB).sorted()

print(arrayC)
