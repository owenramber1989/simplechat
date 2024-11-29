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
        Message(uid: "12345", text: "明日香123111433412354315123424", photoURL: "", createdAt: Date()),
        Message(uid: "12346", text: "碇真嗣321543123215432512341234", photoURL: "", createdAt: Date()),
        Message(uid: "12347", text: "绫波零532153211253154365465436", photoURL: "", createdAt: Date())
    ]
    
    init() {
        DatabaseManager.shared.fetchMessage { [weak self] result in
            switch result {
            case .success(let msgs):
                self?.messages = msgs
            case .failure(let error):
                print(error)
            }
        }
    }
    func sendMessage(text: String, completion: @escaping (Bool) -> Void) {
        guard let user = AuthManager.shared.getCurrentUser() else {
            return
        }
        let msg = Message(uid: user.uid, text: text, photoURL: user.photoURL, createdAt: Date())
        DatabaseManager.shared.sendMessageToDatabase(message: msg) { success in
            if success {
                self.messages.append(msg)
                completion(true)
            } else {
                completion(false)
            }
            
        }
    }
}
