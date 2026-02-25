//
//  ChatView.swift
//  Ripple
//
//  Created by Hasan Malik on 2026-02-24.
//

import SwiftUI



struct ChatView: View {
    private var contact: Contact;
    
    init(_ contact: Contact) {
        self.contact = contact
    }
    var body: some View {
        VStack {
            Text(contact.name)
            ForEach(contact.previousMessages) { msg in
                
                HStack {
                    msg.sender == "Hasan" ? Spacer() : nil
                    MessageView(msg)
                    msg.sender == "Hasan" ? nil : Spacer()
                }
                .padding()

            }
        }

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
