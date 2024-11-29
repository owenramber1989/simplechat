//
//  Message.swift
//  simplechat
//
//  Created by 张晋铭 on 2024/11/28.
//

import SwiftUI

struct Message : Decodable, Identifiable {
    let id = UUID()
    let uid: String
    let text: String
    let photoURL: String?
    let createdAt: Date
    
    func isFromCurrentUser() -> Bool {
        return true
    }
}
