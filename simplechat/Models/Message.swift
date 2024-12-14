//
//  Message.swift
//  simplechat
//
//  Created by 张晋铭 on 2024/11/28.
//

import SwiftUI

struct Message : Decodable, Identifiable, Equatable, Hashable {
    let id = UUID()
    let uid: String
    let text: String
    let photoURL: String?
    let createdAt: Date
    
    func isFromCurrentUser() -> Bool {
        guard let currUser = AuthManager.shared.getCurrentUser() else {
            return false
        }
        if(currUser.uid == uid) {
            return true
        } else {
            return false
        }
    }
    
    func fetchPhotoURL() -> URL? {
        guard let photoURLString = photoURL, let url = URL(string: photoURLString) else {
            return nil
        }
        return url
    }
}
