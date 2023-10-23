//
//  NewItemViewModel.swift
//  ToDoApp
//
//  Created by Yunus Emre Berdibek on 18.10.2023.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewToDoViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var showAlert: Bool = false
    @Published var dueDate: Date = .init()

    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }

        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }

        return true
    }

    init() {}

    func save() {
        guard canSave else {
            return
        }

        guard let currentUserId = Auth.auth().currentUser?.uid else {
            return
        }
        let newId = NSUUID().uuidString

        let newItem = ToDo(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false)

        let db = Firestore.firestore()
        db.collection("users")
            .document(currentUserId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
}
