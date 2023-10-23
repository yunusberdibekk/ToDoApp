//
//  RegistrationService.swift
//  ToDoApp
//
//  Created by Yunus Emre Berdibek on 19.10.2023.
//

import Firebase
import FirebaseFirestore
import Foundation

final class RegistrationService: RegistrationServiceProtocol {
    static let shared: RegistrationService = .init()

    var db: Firestore = .firestore()

    /// Add created user in users collection.
    /// - Parameter user: created user
    func createUser(user: User) {
        db
            .collection("users")
            .document(user.id)
            .setData(user.asDictionary())
    }
}

protocol RegistrationServiceProtocol {
    var db: Firestore { get }

    func createUser(user: User)
}
