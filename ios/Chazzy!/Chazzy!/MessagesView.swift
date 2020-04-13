//
//  MessagesView.swift
//  Chazzy!
//
//  Created by Quang Nguyen on 4/12/20.
//  Copyright © 2020 Duong Quang Nguyen. All rights reserved.
//

import SwiftUI

struct User: Codable {
    let name: String
}

struct MessagesView: View {
    @State var user: User? = nil
    @State var showOnboardingScreen = false
    @State var messages = ["Dummy message", "wefewfewfew", "wefeewfew"]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 16) {
                    HStack {
                        Text("My Friends")
                            .font(.headline)
                        
                        Spacer()
                    }.padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(0 ..< 5) { idx in
                                VStack(spacing: 12) {
                                    Image(uiImage: UIImage())
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .background(Color(UIColor.secondarySystemBackground))
                                        .clipShape(Circle())
                                    Text("@first_name")
                                        .font(.system(size: 16, weight: .medium, design: .default))
                                }
                            }
                        }.padding(.horizontal)
                    }
                    
                    HStack {
                        Text("Messages (\(messages.count))")
                            .font(.headline)
                        Spacer()
                    }.padding(.horizontal)
                        .padding(.top, 12)
                    
                    ForEach(messages, id: \.self) { msg in
                        NavigationLink(destination: Text("ChatView")) {
                            HStack(spacing: 16) {
                                Image(uiImage: UIImage())
                                    .resizable()
                                    .frame(width: 87.5, height: 87.5)
                                    .background(Color(UIColor.secondarySystemBackground))
                                    .clipShape(Circle())
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("@username")
                                        .font(.headline)
                                    Text(msg)
                                        .font(.subheadline)
                                }.foregroundColor(.primary)
                                
                                Spacer()
                                
                                Text("3 mins ago")
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                                    .frame(width: 50)
                                    .lineSpacing(0)
                                    .multilineTextAlignment(.trailing)
                            }.padding(.horizontal)
                        }
                    }
                }.padding(.vertical)
            }.navigationBarTitle(Text("Recents"))
        }
    }
}

struct OnboardingScreen: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 16) {
                Text("Hello, Chazzy!")
                
                Button(action: {
                }) {
                    Text("Sign In")
                }
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Sign Up")
                }
            }.padding()
        }
    }
}
