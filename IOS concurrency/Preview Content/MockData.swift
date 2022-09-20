//
//  MockData.swift
//  IOS concurrency
//
//  Created by didin amarudin on 20/09/22.
//

import Foundation

extension User {
    static var mockUsers: [User] {
        Bundle.main.decode([User].self, from: "users.json")
    }
    
    static var mockSingleUser: User {
        self.mockUsers[0]
    }
}


extension Post {
    static var mockPosts: [Post] {
        Bundle.main.decode([Post].self, from: "posts.json")
    }
    
    static var mockSinglePost: Post {
        self.mockPosts[0]
    }
    
    static var mockSingleUserPostsArray: [Post] {
        self.mockPosts.filter {$0.userId  == 1}
    }
}
