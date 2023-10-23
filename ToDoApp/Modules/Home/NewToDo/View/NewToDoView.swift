//
//  NewToDoView.swift
//  ToDoApp
//
//  Created by Yunus Emre Berdibek on 18.10.2023.
//

import SwiftUI

struct NewToDoView: View {
    @StateObject var viewModel: NewToDoViewModel = .init()
    @Binding var newToDoViewPresented: Bool

    var body: some View {
        VStack(content: {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 50)

            Form(content: {
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(.plain)

                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(.graphical)

                CustomFormButtonView(
                    title: "Save",
                    background: .pink,
                    action: {
                        if viewModel.canSave {
                            viewModel.save()
                            newToDoViewPresented = false
                        } else {
                            viewModel.showAlert = true
                        }
                    })
                    .alert("Error", isPresented: $viewModel.showAlert, actions: {}, message: {
                        Text("Please fill in all fields and select due date  that is today or newer.")
                    }) //: ALERT
                    .padding()
            }) //: FORM
        }) //: VSTACK
    }
}

#Preview {
    NewToDoView(newToDoViewPresented: .constant(false))
}
