//
//  CustomTextFieldModifier.swift
//  ToDoApp
//
//  Created by Yunus Emre Berdibek on 18.10.2023.
//

import SwiftUI

struct CustomTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .textFieldStyle(.roundedBorder)
    }
}
