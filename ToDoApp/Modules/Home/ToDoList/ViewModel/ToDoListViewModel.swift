//
//  ItemListViewModel.swift
//  ToDoApp
//
//  Created by Yunus Emre Berdibek on 18.10.2023.
//

import FirebaseFirestore
import Foundation

/// ViewModel for list of items view
/// Primary tab
class ToDoListViewModel: ObservableObject {
    @Published var showingNewToDoView: Bool = false

    private let userId: String

    init(userId: String) {
        self.userId = userId
    }

    /// Delete to do list item
    /// - Parameter id: Item id to delete
    func delete(id: String) {
        let db = Firestore.firestore()

        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
