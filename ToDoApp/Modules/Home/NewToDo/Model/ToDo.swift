//
//  ToDoListItem.swift
//  ToDoApp
//
//  Created by Yunus Emre Berdibek on 19.10.2023.
//

import Foundation

struct ToDo: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool

    mutating func setDone(_ state: Bool) {
        isDone = state
    }

    #if DEBUG
        static let dummyListItemWithFalse = ToDo(
            id: NSUUID().uuidString,
            title: "Dummy to do item",
            dueDate: Date().timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false)

        static let dummyListItemWithTrue = ToDo(
            id: NSUUID().uuidString,
            title: "Dummy to do item",
            dueDate: Date().timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: true)
    #endif
}
