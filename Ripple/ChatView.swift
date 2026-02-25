//
//  ChatView.swift
//  Ripple
//
//  Created by Hasan Malik on 2026-02-24.
//

import SwiftUI



struct ChatView: View {
    @Environment(Profile.self) var user

    private var contact: Contact;
    
    @State private var currMsg: String = ""
    
    init(_ contact: Contact) {
        self.contact = contact
    }
    var body: some View {
        VStack {
            ForEach(contact.previousMessages) { msg in
                
                HStack {
                    msg.sender == user.name ? Spacer() : nil
                    MessageView(msg)
                    msg.sender == user.name ? nil : Spacer()
                }
                .padding()

            }
            
            Spacer()
            
            HStack {
                TextField("Type a message...", text: $currMsg)
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.primary, lineWidth:1)
                    }
                Button("Send") {
                    contact.previousMessages.append(Message(user.name, contact.name, currMsg))
                }
            }
            .padding()

                


            
        }
        .navigationTitle(contact.name)

    }
}

