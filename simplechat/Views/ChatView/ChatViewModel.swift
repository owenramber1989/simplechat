//
//  ChatViewModel.swift
//  simplechat
//
//  Created by 张晋铭 on 2024/11/28.
//

import SwiftUI

class ChatViewModel: ObservableObject{
    
    @Published var messages = [Message]()
    
    @Published var mockData = [
        Message(id: UUID(), uid: "12345", text: "明日香123111433412354315123424", photoURL: "", createdAt: Date()),
        Message(id: UUID(), uid: "12346", text: "碇真嗣321543123215432512341234", photoURL: "", createdAt: Date()),
        Message(id: UUID(), uid: "12347", text: "绫波零532153211253154365465436", photoURL: "", createdAt: Date())
    ]
    func sendMessage(text: String) {
        print(text)
    }
}
