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
        if  isCurrentUser {
            HStack(spacing: 2) {
                HStack {
                    if let img = message.image, let text = message.text, !text.isEmpty {
                        GeometryReader { geometry in
                            VStack(alignment: .leading, spacing: 8) {
                                Text(text)
                                    .padding([.top, .bottom], 4)
                                    .padding([.leading, .trailing], 8)
                                    .background(Color.blue.opacity(0.2))
                                    .cornerRadius(10)
                                    .foregroundColor(.black)
                                    .lineLimit(nil) // 确保文本可以多行显示
                                    .frame(maxWidth: geometry.size.width - 16) // 减去内边距
                                    .fixedSize(horizontal: false, vertical: true) // 允许垂直扩展
                                
                                img
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                                    .frame(maxWidth: geometry.size.width - 16) // 减去内边距
                            }
                            .padding(.horizontal, 8) // 给整个 VStack 添加水平内边距
                        }
                        .frame(height: 200) // 固定高度以适应图片
                    } else if let img = message.image {
                        // 只有图片时显示图片
                        img
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    } else if let text = message.text, !text.isEmpty {
                        // 只有文本时显示文本
                        Text(text)
                            .padding()
                            .background(Color.blue.opacity(0.2))
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
                    if let img = message.image, let text = message.text, !text.isEmpty {
                        GeometryReader { geometry in
                            VStack(alignment: .leading, spacing: 8) {
                                Text(text)
                                    .padding([.top, .bottom], 4)
                                    .padding([.leading, .trailing], 8)
                                    .background(Color.blue.opacity(0.2))
                                    .cornerRadius(10)
                                    .foregroundColor(.black)
                                    .lineLimit(nil) // 确保文本可以多行显示
                                    .frame(maxWidth: geometry.size.width - 16) // 减去内边距
                                    .fixedSize(horizontal: false, vertical: true) // 允许垂直扩展
                                
                                img
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                                    .frame(maxWidth: geometry.size.width - 16) // 减去内边距
                            }
                            .padding(.horizontal, 8) // 给整个 VStack 添加水平内边距
                        }
                        .frame(height: 200) // 固定高度以适应图片
                    } else if let img = message.image {
                        // 只有图片时显示图片
                        img
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    } else if let text = message.text, !text.isEmpty {
                        // 只有文本时显示文本
                        Text(text)
                            .padding()
                            .background(Color.blue.opacity(0.2))
                            .cornerRadius(20)
                            .foregroundColor(.primary)
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

