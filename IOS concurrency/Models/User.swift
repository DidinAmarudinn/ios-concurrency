//
//  User.swift
//  IOS concurrency
//
//  Created by didin amarudin on 19/09/22.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let username: String
    let name: String
    let email: String
}
