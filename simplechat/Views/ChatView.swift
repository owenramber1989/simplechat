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
    func sendMessage(text: String) {
        print(text)
    }
}

struct ChatView: View {
    @StateObject var chatViewModel = ChatViewModel()
    @State var text = ""
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 8) {
                    ForEach(chatViewModel.mockData) { message in
                        MessageView(message: message)
                    }
                }
            }
            HStack {
                TextField("良言一句三冬暖", text: $text, axis: .vertical)
                    .padding()
                Button {
                    chatViewModel.sendMessage(text: text)
                    text = ""
                } label: {
                    Text("Send")
                        .padding()
                        .foregroundColor(.white)
                        .background(.pink)
                        .background(.cyan)
                        .cornerRadius(30)
                        .padding(.trailing)
                }
                .padding()
            }
            .background(Color(uiColor: .systemGray6))
        }
    }
}

#Preview {
    ChatView()
}
