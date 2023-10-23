//
//  LoginView.swift
//  ToDoApp
//
//  Created by Yunus Emre Berdibek on 18.10.2023.
//

import SwiftUI

struct LoginView: View {
    @State var viewModel: LoginViewModel = .init()

    var body: some View {
        NavigationStack {
            VStack {
                HeaderView(
                    title: "To Do List",
                    subTitle: "Get things done",
                    angle: 15,
                    background: .pink)

                Form(content: {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .font(.footnote)
                            .foregroundStyle(.red)
                    }

                    TextField(
                        "Email adress",
                        text: $viewModel.emailAdress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()

                    SecureField(
                        "Password",
                        text: $viewModel.password)

                    CustomFormButtonView(
                        title: "Log In",
                        background: .blue, action: {
                            viewModel.login()
                        })
                        .padding()
                }) //: FORM
                .modifier(CustomTextFieldModifier())
                .offset(y: -50)

                VStack(content: {
                    Text("New around here?")

                    NavigationLink("Create Account") {
                        RegistrationView()
                    }
                }) //: VSTACK
                .padding(.bottom, 15)

                Spacer()
            }
        } // :VSTACK
    }
}

#Preview {
    LoginView()
}
