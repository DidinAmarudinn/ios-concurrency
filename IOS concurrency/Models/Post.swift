//
//  Post.swift
//  IOS concurrency
//
//  Created by didin amarudin on 19/09/22.
//

import Foundation

struct Post: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
