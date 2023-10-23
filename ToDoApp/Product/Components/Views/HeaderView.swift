//
//  HeaderView.swift
//  ToDoApp
//
//  Created by Yunus Emre Berdibek on 18.10.2023.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subTitle: String
    let angle: Double
    let background: Color

    var body: some View {
        ZStack(content: {
            RoundedRectangle(cornerRadius: 0)
                .foregroundStyle(background)
                .rotationEffect(.degrees(angle))
                .ignoresSafeArea()

            VStack(content: {
                VStack(spacing: 8) {
                    Text(title)
                        .font(.system(size: 50))
                        .bold()
                    Text(subTitle)
                        .font(.system(size: 30))
                }
                .foregroundStyle(.white)
            }) //: VSTACK
            .padding(.top, 80)

        }) //: ZSTACK
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
        .offset(y: -150)
    }
}

#Preview {
    HeaderView(title: "To Do List", subTitle: "Get things done", angle: 15, background: .pink)
}
