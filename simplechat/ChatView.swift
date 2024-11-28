//
//  ChatView.swift
//  simplechat
//
//  Created by 张晋铭 on 2024/11/28.
//

import SwiftUI

class ChatViewModel: ObservableObject{
    
    @Published var messages = [Message]()
    
    @Published var mockData = [
        Message(id: UUID(), uid: "12345", text: "明日香", photoURL: "", createdAt: Date()),
        Message(id: UUID(), uid: "12346", text: "碇真嗣", photoURL: "", createdAt: Date()),
        Message(id: UUID(), uid: "12347", text: "绫波零", photoURL: "", createdAt: Date())
    ]
}

struct ChatView: View {
    @StateObject var chatViewModel = ChatViewModel()
    @State var text = "你好"
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 8) {
                    ForEach(chatViewModel.mockData) { message in
                        MessageView(message: message)
                    }
                }
            }
            HStack {
                TextField("hello", text: $text, axis: .vertical)
                    .padding()
                    .background(Color(uiColor: .systemMint))
                Button {
                    print("send")
                } label: {
                    Text("Send")
                }
                .padding()
            }
        }
    }
}

#Preview {
    ChatView()
}
