//
//  RegisterView.swift
//  ToDoApp
//
//  Created by Yunus Emre Berdibek on 18.10.2023.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel: RegistrationViewModel = .init()

    var body: some View {
        VStack {
            HeaderView(
                title: "Register",
                subTitle: "Start organizing todos",
                angle: -15,
                background: .orange)

            Form(content: {
                TextField(
                    "Full Name",
                    text: $viewModel.fullName)
                    .autocorrectionDisabled()

                TextField(
                    "Email Adress",
                    text: $viewModel.emailAdress)
                    .textInputAutocapitalization(.none)
                    .autocorrectionDisabled()

                SecureField(
                    "Password",
                    text: $viewModel.password)

                CustomFormButtonView(
                    title: "Create Account",
                    background: .green,
                    action: {
                        viewModel.register()
                    })
                    .padding()
            })
            .offset(y: -75)
            .textFieldStyle(.plain)

            Spacer()
        }
    }
}

#Preview {
    RegistrationView()
}
