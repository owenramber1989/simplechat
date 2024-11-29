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
                ChatView()
            }
            .navigationTitle("chatroom")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("sign out")
                    } label: {
                        Text("Sign Out")
                            .foregroundColor(.red)
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $showSignIn) {
            SignInView(showSignIn: $showSignIn)
        }
    }
}

#Preview {
    ContentView()
}
