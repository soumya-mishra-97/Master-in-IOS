import SwiftUI
import Foundation
/*
 {
     "post_id": 1,
     "id": 1,
     "name": "id labore ex et quam laborum",
     "email": "Eliseo@gardner.biz",
     "body": "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"
   }
*/


// MARK: - Model
struct Post: Decodable, Identifiable {
    let post_id: Int
    let id: Int
    let name, email, body: String

    enum CodingKeys: String, CodingKey {
        case post_id
        case id
        case name
        case email
        case body
    }
}

// MARK: - Post View
struct PostView: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Name: \(post.name)")
            Text("Email: \(post.email)")
            Text("Body: \(post.body)")
        }
        .padding()
    }
}

// MARK: - Dummy Data
let dummyPosts: [Post] = [
    Post(post_id: 1, id: 1, name: "John Doe", email: "john@example.com", body: "This is a test comment."),
    Post(post_id: 1, id: 2, name: "Jane Smith", email: "jane@example.com", body: "Another test comment.")
]

// MARK: - List View
struct ContentView: View {
    var body: some View {
        List(dummyPosts) { post in
            PostView(post: post)
        }
    }
}

// MARK: - App Entry Point
/*@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}*/

/*
 Given array - [1, 3, 6, 2, nil, 7, 2, nil, 9, 11]
   Even number should replace with +1 and odd should replace with -1
   Nil, should also replace with -1
  Expected output - [-1, -1, +1, +1, -1, -1, +1, -1, -1, -1]
 */

let n = [1, 3, 6, 2, nil, 7, 2, nil, 9, 11]
let replaceNum = n.map { n in
    guard let num = n else{
        return -1 /// nil handling
    }
    return num % 2 == 0 ? 1 : -1
}
print(replaceNum)
