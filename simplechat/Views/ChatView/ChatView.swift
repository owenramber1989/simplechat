//
//  ChatView.swift
//  simplechat
//
//  Created by 张晋铭 on 2024/11/28.
//

import SwiftUI
import PhotosUI

struct ChatView: View {
    @StateObject var chatViewModel = ChatViewModel()
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    @State var text = ""
    @FocusState private var isTextFieldFocused: Bool
    @State private var keyboardHeight: CGFloat = 0
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
                .padding(.bottom, 5)
            }
            HStack {
                PhotosPicker(selection: $selectedItem, matching: .images) {
                    Image(systemName: "photo")
                        .padding()
                        .foregroundColor(.white)
                        .background(.pink)
                        .cornerRadius(30)
                        .padding(.trailing)
                }
                .onChange(of: selectedItem) { newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                            selectedImageData = data
                        }
                    }
                }
                .buttonStyle(PlainButtonStyle())
                TextField("良言一句三冬暖", text: $text, axis: .vertical)
                    .padding()
                    .focused($isTextFieldFocused)
                    
                Button(action: {
                    if text.count > 0 || selectedImageData != nil {
                        chatViewModel.sendMessage(text: text, imageData: selectedImageData ?? Data()) { success in
                            if success {
                                print("succeed in sending message")
                            } else {
                                print("error sending message")
                            }
                        }
                        text = ""
                        isTextFieldFocused = false
                        selectedItem = nil
                        selectedImageData = nil
                    }
                }) {
                    Text("Send")
                        .padding()
                        .foregroundColor(.white)
                        .background(.cyan)
                        .cornerRadius(30)
                        .padding(.trailing)
                }
                .buttonStyle(PlainButtonStyle())
                .background(Color.clear)
                .contentShape(Rectangle())
                .padding()
            }
            .background(Color(uiColor: .systemGray6))
        }
        .animation(.default, value: keyboardHeight)
    }
}

#Preview {
    ChatView()
}
