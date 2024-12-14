//
//  DatabaseManager.swift
//  simplechat
//
//  Created by 张晋铭 on 2024/11/29.
//
import FirebaseCore
import FirebaseFirestore

enum fetchMessagesError: Error {
    case snapshotError
}

final class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    let database = Firestore.firestore()
    
    func fetchMessage(completion: @escaping (Result<[Message], fetchMessagesError>) -> Void) {
        database.collection("messages").order(by: "createdAt", descending: true).limit(to: 20).getDocuments { snapshot, error in
            guard let snapshot = snapshot, error == nil else {
                completion(.failure(.snapshotError))
                return
            }
            
            let docs = snapshot.documents
            
            var messages = [Message]()
            for doc in docs {
                let data = doc.data()
                let text = data["text"] as? String ?? "Error"
                let uid = data["uid"] as? String ?? "Error"
                let photoURL = data["photoURL"] as? String ?? "Error"
                let createdAt = data["createdAt"] as? Timestamp ?? Timestamp()
                let imageData = data["imageData"] as? Data ?? Data()
                
                let msg = Message(uid: uid, text: text, photoURL: photoURL, createdAt: createdAt.dateValue(), imageData: imageData)
                messages.append(msg)
            }
            
            messages.sort(by: { $0.createdAt < $1.createdAt })
            completion(.success(messages))
        }
    }
    
    func sendMessageToDatabase(message: Message, completion: @escaping (Bool) -> Void) {
        let data = [
            "text": message.text ?? "",
            "uid": message.uid,
            "createdAt": Timestamp(date: message.createdAt),
            "photoURL": message.photoURL ?? "",
            "imageData": message.imageData ?? Data()
        ] as [String: Any]
        _ = database.collection("messages").addDocument(data: data) { error in
            guard error == nil else {
                completion(false)
                return
            }
            completion(true)
        }
    }
}
