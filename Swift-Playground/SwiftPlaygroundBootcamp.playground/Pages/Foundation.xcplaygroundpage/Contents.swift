// MARK: - Foundation Framework in Swift
/*
 The Foundation framework is one of Apple's core frameworks, providing essential data types, collections,
 and utilities for Swift and Objective-C development.
 It includes fundamental classes like Date, URL, Data, UserDefaults, NotificationCenter, and more.
 
 Importing Foundation
 Working with Dates (Date & DateFormatter)
 The Date class represents a point in time, and DateFormatter helps in formatting dates.
 
 Working with URLs (URL)
 Foundation provides URL for handling web addresses, file paths, and more.
 
 Networking (URLSession)
 URLSession allows you to fetch data from the web.
 
 Working with Strings (NSString & NSAttributedString)
 Swift has a native String type, but Foundation provides additional utilities.
 Working with NSAttributedString (Formatted Text)
 
 Data Management (UserDefaults)
 UserDefaults is used to store small amounts of data persistently.
 
 Saving Data
 UserDefaults.standard.set("John Doe", forKey: "username")

 Retrieving Data
 let username = UserDefaults.standard.string(forKey: "username")
 print(username ?? "No username found")

 
 Notifications (NotificationCenter)
 Used for sending and receiving notifications within an app.
 Posting a Notification -> .post
 Observing a Notification -> .addObserver
 
 JSON Parsing (Codable)
 Foundation provides Codable for encoding and decoding JSON data.
 Decoding JSON into a Swift Struct
 JSONDecoder().decode
 
 Encoding a Swift Object to JSON
 JSONEncoder().encode
 
 File Management (FileManager)
 Foundation provides FileManager for working with files.
 Getting the Documents Directory
 let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
 print(documentsDirectory?.path ?? "No directory found")

 Writing a File
 let filePath = documentsDirectory?.appendingPathComponent("example.txt")
 let content = "Hello, file system!".data(using: .utf8)
 try? content?.write(to: filePath!)

 Reading a File
 if let filePath = filePath, let savedContent = try? String(contentsOf: filePath) {
     print(savedContent)  // "Hello, file system!"
 }
*/
