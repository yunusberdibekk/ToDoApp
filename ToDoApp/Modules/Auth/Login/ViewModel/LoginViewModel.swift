//
//  LoginViewModel.swift
//  ToDoApp
//
//  Created by Yunus Emre Berdibek on 18.10.2023.
//

import FirebaseAuth
import Foundation

class LoginViewModel: ObservableObject {
    @Published var emailAdress: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""

    func login() {
        guard validate() else {
            return
        }

        Auth.auth().signIn(withEmail: emailAdress, password: password)
    }

    func validate() -> Bool {
        errorMessage = ""
        guard !emailAdress.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            errorMessage = "Please fill in all fields."
            return false
        }

        guard emailAdress.contains("@") && emailAdress.contains(".") else {
            errorMessage = "Please enter valid email."
            return false
        }

        return true
    }
}
