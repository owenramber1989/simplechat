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
        if message.isFromCurrentUser() {
            HStack {
                HStack {
                    Text(message.text)
                        .padding()
                }
                .frame(maxWidth: 250, alignment: .topLeading)
                .background(Color(uiColor: .systemBlue))
                .cornerRadius(20)
                
                Image(uiImage: UIImage(named:  "Asuka_Langley_Soryu")!)
                    .resizable()  // 使图片可调整大小
                        .aspectRatio(contentMode: .fit)  // 保持原始纵横比并填充指定的框架
                    .frame(maxWidth: 80, alignment: .top)
                    .padding(.bottom, 16)
                    .padding(.leading, 4)
                    .cornerRadius(20)
            }
            .frame(maxWidth: 360,alignment: .leading)
        } else {
            HStack {
                Image(systemName: "person")
                    .frame(maxWidth: 32, alignment: .top)
                    .padding(.bottom, 16)
                    .padding(.trailing, 4)
                HStack {
                    Text(message.text)
                        .padding()
                }
                .frame(maxWidth: 250, alignment: .leading)
                .background(Color(uiColor: .lightGray))
                .cornerRadius(20)
            }
            .frame(maxWidth: 360,alignment: .leading)
        }
    }
}

#Preview {
    MessageView(message: Message(id: UUID(), uid: "123", text: "我是明日香", photoURL: "", createdAt: Date()))
}

