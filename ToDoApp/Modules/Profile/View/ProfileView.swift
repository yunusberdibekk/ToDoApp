//
//  ProfileView.swift
//  ToDoApp
//
//  Created by Yunus Emre Berdibek on 18.10.2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel: ProfileViewModel = .init()

    var body: some View {
        NavigationStack {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profile...")
                }
            } //: VSTACK
            .navigationTitle("Profile")
        } //: STACK
        .onAppear(perform: {
            viewModel.fetchUser()
        })
    }

    @ViewBuilder
    private func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(.blue)
            .frame(width: 125, height: 125)

        VStack(alignment: .leading, content: {
            HStack(content: {
                Text("Name: ")
                    .bold()

                Text(user.name)
            }) //: HSTACK
            .padding()

            HStack(content: {
                Text("Email: ")
                    .bold()

                Text(user.emailAdress)
            }) //: HSTACK
            .padding()

            HStack(content: {
                Text("Member Since: ")
                    .bold()

                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }) //: HSTACK
            .padding()

        }) //: VSTACK
        .padding()

        Button("Log Out", action: {
            viewModel.logOut()
        })
        .tint(.red)
        .padding()
    }
}

#Preview {
    ProfileView()
}
