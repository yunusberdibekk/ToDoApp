//
//  RootViewModel.swift
//  ToDoApp
//
//  Created by Yunus Emre Berdibek on 18.10.2023.
//

import FirebaseAuth
import Foundation

class RootViewModel: ObservableObject {
    @Published var currentUserId: String?
    private var handler: AuthStateDidChangeListenerHandle?

    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid
            }
        }
    }

    public var isSignedIn: Bool {
        Auth.auth().currentUser != nil
    }

    func dummyInit() -> Self {
        currentUserId = "4FyUys4okZdChzb7qDoBpaUJV4v2"
        return self
    }
}
