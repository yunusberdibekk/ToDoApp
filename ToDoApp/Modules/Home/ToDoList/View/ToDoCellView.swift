//
//  ToDoCellView.swift
//  ToDoApp
//
//  Created by Yunus Emre Berdibek on 18.10.2023.
//

import SwiftUI

struct ToDoCellView: View {
    @StateObject var viewModel: ToDoItemViewModel = .init()
    let item: ToDo

    var body: some View {
        HStack(content: {
            VStack(alignment: .leading, content: {
                Text(item.title)
                    .font(.body)
                    .bold()

                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(Color(.secondaryLabel))
            }) //: VSTACK

            Spacer()

            Button(action: {
                viewModel.toggleIsDone(item: item)
            }, label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(.blue)
            }) //: BUTTON
        }) //: HSTACK
    }
}

#Preview {
    ToDoCellView(item: ToDo.dummyListItemWithTrue)
}
