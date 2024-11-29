//
//  SignInView.swift
//  simplechat
//
//  Created by 张晋铭 on 2024/11/28.
//

import SwiftUI

struct SignInView: View {
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
                    print("apple")
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
                    print("google")
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
    SignInView()
}
