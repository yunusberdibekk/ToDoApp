//
//  User.swift
//  ToDoApp
//
//  Created by Yunus Emre Berdibek on 18.10.2023.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let emailAdress: String
    let joined: TimeInterval
}
