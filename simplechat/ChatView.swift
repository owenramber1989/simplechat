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
    var body: some View {
        VStack(spacing: 8) {
            ForEach(chatViewModel.mockData) { message in
                MessageView(message: message)
            }
        }
    }
}

#Preview {
    ChatView()
}
