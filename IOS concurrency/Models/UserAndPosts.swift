//
//  UserAndPost.swift
//  IOS concurrency
//
//  Created by didin amarudin on 20/09/22.
//

import Foundation

struct UserAndPosts: Identifiable {
    var id = UUID()
    let user: User
    let posts: [Post]
    var numberOfPosts: Int {
        posts.count
    }
}
