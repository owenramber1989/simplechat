//
//  AuthManager.swift
//  simplechat
//
//  Created by 张晋铭 on 2024/11/29.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth

enum GoogleSignInError: Error {
    case unableToGrabTopVC
    case signInPresentationError
    case signInAuthError
}

struct SimpleChatUser {
    let uid: String
    let userName: String
    let email: String?
    let photoURL: String?
}

extension UIApplication {
    class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)
        }
        if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
}

class AuthManager {
    
    static let shared = AuthManager()
    
    let auth = Auth.auth()
    
    func signInWithGoogle(completion: @escaping (Result<SimpleChatUser, GoogleSignInError>) -> Void) {
        let clientID = "1083246594834-a9knidnr8p2kv3ojlkqp3qsg4t3a4404.apps.googleusercontent.com"
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        guard let topVC = UIApplication.getTopViewController() else {
            completion(.failure(.unableToGrabTopVC))
            return
        }
        GIDSignIn.sharedInstance.signIn(withPresenting: topVC) { [unowned self] result, error in
            guard error == nil else {
                return
            }
            
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString
            else {
                completion(.failure(.signInPresentationError))
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: user.accessToken.tokenString)
            
            auth.signIn(with: credential) { result, error in
                guard let result = result, error == nil else {
                    completion(.failure(.signInAuthError))
                    return
                }
                let user = SimpleChatUser(uid: result.user.uid, userName: result.user.displayName ?? "Unknown", email: result.user.email, photoURL: result.user.photoURL?.absoluteString)
                completion(.success(user))
            }
        }
    }
}
