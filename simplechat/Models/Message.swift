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
    let text: String?
    let photoURL: String? // 用户的头像
    let createdAt: Date
    
    let imageData: Data? // 图片的二进制数据
    
    var image: Image? {
        if let data = imageData, let uiImage = UIImage(data: data) {
            return Image(uiImage: uiImage)
        }
        return nil
    }
    
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
