//
//  ChatViewModel.swift
//  simplechat
//
//  Created by 张晋铭 on 2024/11/28.
//

import SwiftUI

class ChatViewModel: ObservableObject{
    
    @Published var messages = [Message]()
    
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
