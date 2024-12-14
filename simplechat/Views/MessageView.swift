//
//  MessageView.swift
//  simplechat
//
//  Created by 张晋铭 on 2024/11/28.
//

import SwiftUI
import SDWebImageSwiftUI


struct MessageView: View {
    var message: Message
    var body: some View {
        let isCurrentUser = message.isFromCurrentUser()
        let alignment: Alignment = isCurrentUser ? .trailing : .leading
        let backgroundColor: Color = isCurrentUser ? Color(uiColor: .systemBlue) : Color(uiColor: .systemGray5)
        if  message.isFromCurrentUser() {
            HStack(spacing: 2) {
                HStack {
                    if let img = message.image {
                        img
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    } else if let text = message.text, !text.isEmpty {
                        Text(text)
                            .padding()
                            .background(backgroundColor)
                            .cornerRadius(20)
                            .foregroundColor(.white)
                    }
                }
                .frame(maxWidth: 250, alignment: alignment)
                
                if let photoURL = message.fetchPhotoURL() {
                    WebImage(url: photoURL)
                        .resizable()  // 使图片可调整大小
                        .frame(width: 60, height: 60, alignment: .top)
                        .cornerRadius(30)
                        .padding(.leading)
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()  // 使图片可调整大小
                        .frame(width: 36, height: 36, alignment: .top)
                        .cornerRadius(18)
                        .padding(.leading)
                        .foregroundColor(.gray)
                }
            }
            .frame(maxWidth: 300,alignment: .leading)
        } else {
            HStack {
                if let photoURL = message.fetchPhotoURL() {
                    WebImage(url: photoURL)
                        .resizable()  // 使图片可调整大小
                        .frame(width: 60, height: 60, alignment: .top)
                        .cornerRadius(30)
                        .padding(.leading)
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()  // 使图片可调整大小
                        .frame(width: 36, height: 36, alignment: .top)
                        .cornerRadius(18)
                        .padding(.leading)
                        .foregroundColor(.gray)
                }
                HStack {
                    if let img = message.image {
                        img
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    } else if let text = message.text, !text.isEmpty {
                        Text(text)
                            .padding()
                            .background(backgroundColor)
                            .cornerRadius(20)
                            .foregroundColor(.white)
                    }
                }
                .frame(maxWidth: 250, alignment: .leading)
            }
            .frame(maxWidth: 360,alignment: alignment)
        }
    }
}

#Preview {
}

