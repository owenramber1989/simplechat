//
//  MessageView.swift
//  simplechat
//
//  Created by 张晋铭 on 2024/11/28.
//

import SwiftUI



struct MessageView: View {
    var message: Message
    var body: some View {
        if !message.isFromCurrentUser() {
            HStack(spacing: 2) {
                HStack {
                    Text(message.text)
                        .padding()
                        .background(Color(uiColor: .systemBlue))
                        .cornerRadius(20)
                }
                .frame(maxWidth: 250, alignment: .trailing)
                
                
                Image("asukaicon")
                    .resizable()  // 使图片可调整大小
                    .frame(width: 60, height: 60, alignment: .top)
                    .cornerRadius(30)
                    .padding(.leading)
            }
            .frame(maxWidth: 300,alignment: .leading)
        } else {
            HStack {
                Image(systemName: "person")
                    .frame(maxWidth: 32, alignment: .top)
                    .padding(.bottom, 16)
                    .padding(.trailing, 4)
                HStack {
                    Text(message.text)
                        .padding()
                        .background(Color(uiColor: .systemGray5))
                        .cornerRadius(20)
                }
                .frame(maxWidth: 250, alignment: .leading)
            }
            .frame(maxWidth: 360,alignment: .leading)
        }
    }
}

#Preview {
    MessageView(message: Message(uid: "123", text: "我是明日香", photoURL: "", createdAt: Date()))
}

