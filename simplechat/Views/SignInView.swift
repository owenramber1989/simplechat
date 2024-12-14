//
//  SignInView.swift
//  simplechat
//
//  Created by 张晋铭 on 2024/11/28.
//

import SwiftUI

struct SignInView: View {
    @Binding var showSignIn: Bool
    var body: some View {
        VStack(spacing: 20) {
            Image("asuka")
                .resizable()
                .frame(maxWidth: 400, maxHeight: 700, alignment: .top)
                .scaledToFill()
                .clipped()
            Spacer()
            VStack(spacing: 10) {
                Button {
                    AuthManager.shared.signInWithApple { result in
                        switch result {
                        case .success(_):
                            showSignIn = false
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                } label: {
                    Text("Sign in with Apple")
                        .padding()
                        .foregroundColor(.primary)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke()
                                .foregroundColor(.primary)
                                .frame(width: 300)
                        }
                }
                Button {
                    AuthManager.shared.signInWithGoogle { result in
                        switch result {
                        case .success(_):
                            showSignIn = false
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                } label: {
                    Text("Sign in with Google")
                        .padding()
                        .foregroundColor(.primary)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke()
                                .foregroundColor(.primary)
                                .frame(width: 300)
                        }
                }
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    SignInView(showSignIn: .constant(true))
}
