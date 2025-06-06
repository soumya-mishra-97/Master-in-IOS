// MARK: - ENUM
/// Define a group of related values in a type-safe way.
/// An enum defines a common type for a group of related values and enables you to work with those values in a type-safe way.

/// Use basic enums when you need a clean list of states or values.
/// Use `raw value:` enums when each case maps to a fixed, external value.
/// Use `associated value:` enums when each case needs to carry extra, custom information.
/// Enums make your Swift code type-safe, readable, and robust.

enum Direction {
    case north
    case south
    case east
    case west
}
let dir = Direction.north


// MARK: - Raw type
/// Assign a constant primitive value (String, Int, etc.) to each case.
/// All cases must have the same raw value type.
enum Day:String {
  case day1 = "Monday"
  case day2 = "Tuesday"
}

// MARK: - Associate type
/// Each case can hold custom associated data (like a tuple).
/// Different cases can hold different types of data.
enum Month{
    case January(day: Int)
    case February(day: Int)
}

let jan = Month.January(day: 31)

func printDay(in month: Month){
    switch month {
    case .January(let day),
            .February(let day):
       print(day)
    }
}

printDay(in: jan)
