//
//  ToDoListView.swift
//  ToDoApp
//
//  Created by Yunus Emre Berdibek on 18.10.2023.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewModel
    @FirestoreQuery var items: [ToDo]

    init(userID: String) {
        self._items = FirestoreQuery(
            collectionPath: "users/\(userID)/todos")

        self._viewModel = StateObject(wrappedValue: ToDoListViewModel(userId: userID))
    }

    var body: some View {
        NavigationStack {
            VStack(content: {
                List(items) { item in
                    ToDoCellView(item: item)
                        .swipeActions {
                            Button(action: {
                                viewModel.delete(id: item.id)
                            }, label: {
                                Text("Delete")
                            }) //: BUTTON
                            .tint(.red)
                        }
                } //: LIST
                .listStyle(.plain)
            }) //: VSTACK
            .navigationTitle("To Do List")
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        viewModel.showingNewToDoView = true
                    }, label: {
                        Image(systemName: "plus")
                    }) //: BUTTON
                    .sheet(isPresented: $viewModel.showingNewToDoView, content: {
                        NewToDoView(newToDoViewPresented: $viewModel.showingNewToDoView)
                    })
                }
            }) //: TOOLBAR
        } //: STACK
    }
}

#Preview {
    ToDoListView(userID: "4FyUys4okZdChzb7qDoBpaUJV4v2")
}
