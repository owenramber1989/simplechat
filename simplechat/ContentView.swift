//
//  ContentView.swift
//  simplechat
//
//  Created by 张晋铭 on 2024/11/28.
//

import SwiftUI

struct ContentView: View {
    @State var showSignIn: Bool = true
    var body: some View {
        NavigationStack {
            ZStack {
                if showSignIn {
                    SignInView(showSignIn: $showSignIn)
                } else {
                    ChatView()
                        .navigationTitle("chatroom")
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button {
                                    do {
                                        try AuthManager.shared.signOut()
                                        showSignIn = true
                                    } catch {
                                        print("error signing out")
                                    }
                                } label: {
                                    Text("Sign Out")
                                        .foregroundColor(.red)
                                }
                            }
                        }
                }
            }
        }
        .onAppear {
            showSignIn = AuthManager.shared.getCurrentUser() == nil
        }
    }
}

#Preview {
    ContentView()
}
