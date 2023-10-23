//
//  RegistrationViewModel.swift
//  ToDoApp
//
//  Created by Yunus Emre Berdibek on 18.10.2023.
//

import Firebase
import FirebaseFirestore
import Foundation

class RegistrationViewModel: ObservableObject {
    let registrationService: RegistrationService

    @Published var fullName: String = ""
    @Published var emailAdress: String = ""
    @Published var password: String = ""

    var currentUserID: String? {
        Auth.auth().currentUser?.uid
    }

    init(registrationService: RegistrationService = RegistrationService.shared) {
        self.registrationService = registrationService
    }

    func register() {
        guard validate() else {
            return
        }

        Auth.auth().createUser(withEmail: emailAdress, password: password) { result, _ in
            guard let userId = result?.user.uid else {
                return
            }

            self.insertUserRecord(id: userId)
        }
    }

    func insertUserRecord(id: String) {
        let newUser = User(
            id: id,
            name: fullName,
            emailAdress: emailAdress,
            joined: Date().timeIntervalSince1970)

        registrationService.createUser(user: newUser)
    }

    func validate() -> Bool {
        guard !fullName.trimmingCharacters(in: .whitespaces).isEmpty,
              !emailAdress.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            return false
        }

        guard emailAdress.contains("@") && emailAdress.contains(".") else {
            return false
        }

        guard password.count >= 6 else {
            return false
        }

        return true
    }
}
