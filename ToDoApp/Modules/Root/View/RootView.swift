//
//  ContentView.swift
//  ToDoApp
//
//  Created by Yunus Emre Berdibek on 18.10.2023.
//

import SwiftUI

struct RootView: View {
    @StateObject var rootViewModel: RootViewModel = .init()

    var body: some View {
        if rootViewModel.isSignedIn, rootViewModel.currentUserId != nil {
            tabBar()
        }
        else {
            LoginView()
        }
    }

    @ViewBuilder
    func tabBar() -> some View {
        TabView {
            ToDoListView(userID: rootViewModel.currentUserId ?? "")
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    RootView()
}
