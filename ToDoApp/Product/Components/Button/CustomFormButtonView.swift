//
//  CustomFormButton.swift
//  ToDoApp
//
//  Created by Yunus Emre Berdibek on 18.10.2023.
//

import SwiftUI

struct CustomFormButtonView: View {
    let title: String
    let background: Color
    let action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(background)

                Text(title)
                    .foregroundStyle(.white)
                    .bold()
            } //: ZSTACK
        })
    }
}

#Preview {
    Form {
        CustomFormButtonView(title: "Log In", background: .blue, action: {})
    }
}
