//
//  ItemCellViewModel.swift
//  ToDoApp
//
//  Created by Yunus Emre Berdibek on 18.10.2023.
//

import Firebase
import FirebaseFirestore
import Foundation

/// ViewModel for single to do list item view(each row in item list)
/// Primary tab
class ToDoItemViewModel: ObservableObject {
    init() {}

    func toggleIsDone(item: ToDo) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)

        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }

        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
