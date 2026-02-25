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
    
    init(_ contact: Contact) {
        self.contact = contact
    }
    var body: some View {
        VStack {
            ForEach(contact.previousMessages) { msg in
                
                HStack {
                    msg.sender == user.name ? nil : Spacer()
                    MessageView(msg)
                    msg.sender == user.name ? Spacer() : nil
                }
                .padding()

            }
        }
        .navigationTitle(contact.name)

    }
}

#Preview {
    let messages = [
        Message("Hasan", "Ricky", "Hi, I'm Hasan!"),
        Message("Ricky", "Hasan", "I'm Ricky!")
    ]
    let contact1 = Contact("Ricky", messages)
    ChatView(contact1)
}
