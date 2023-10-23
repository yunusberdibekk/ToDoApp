//
//  ProfileViewModel.swift
//  ToDoApp
//
//  Created by Yunus Emre Berdibek on 18.10.2023.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ProfileViewModel: ObservableObject {
    @Published var user: User? = nil
    init() {}

    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }

        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }

            DispatchQueue.main.async {
                self?.user = User(id: data["id"] as? String ?? "",
                                  name: data["name"] as? String ?? "",
                                  emailAdress: data["emailAdress"] as? String ?? "",
                                  joined: data["joined"] as? TimeInterval ?? 0)
            }
        }
    }

    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch  {
            print(error.localizedDescription)
        }
    }
}
