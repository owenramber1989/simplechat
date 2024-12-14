//
//  ChatView.swift
//  simplechat
//
//  Created by 张晋铭 on 2024/11/28.
//

import SwiftUI

struct ChatView: View {
    @StateObject var chatViewModel = ChatViewModel()
    @State var text = ""
    
    var body: some View {
        VStack {
            ScrollViewReader { scrollView in
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 8) {
                        ForEach(Array(chatViewModel.messages.enumerated()), id: \.element) { idx, message in
                            MessageView(message: message)
                                .id(idx)
                        }
                        .onChange(of: chatViewModel.messages) { newValue in
                            scrollView.scrollTo(chatViewModel.messages.count - 1, anchor: .bottom)
                        }
                    }
                }
            }
            HStack {
                TextField("良言一句三冬暖", text: $text, axis: .vertical)
                    .padding()
                Button {
                    if text.count > 2 {
                        chatViewModel.sendMessage(text: text) { success in
                            if success {
                                print("succeed in sending message")
                            } else {
                                print("error sending message")
                            }
                        }
                        text = ""
                    }
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
