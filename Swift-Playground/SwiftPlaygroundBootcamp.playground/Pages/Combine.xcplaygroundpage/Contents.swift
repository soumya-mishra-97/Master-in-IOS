import Foundation
import Combine

//  MARK: - COMBINE

/// Print the value 1..5 using Combine
let num = (1...5).publisher
    .sink(receiveValue: { print($0) })
