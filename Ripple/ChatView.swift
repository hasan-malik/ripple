//
//  ChatView.swift
//  Ripple
//
//  Created by Hasan Malik on 2026-02-24.
//

import SwiftUI
import Supabase



struct ChatView: View {
    @Environment(Profile.self) var user

    private var contact: Contact;
    
    @State private var currMsg: String = ""
    
    init(_ contact: Contact) {
        self.contact = contact
    }
    var body: some View {
        VStack {
            
            ScrollView{
                ForEach(contact.previousMessages) { msg in
                    
                    HStack {
                        msg.sender_id == user.id ? Spacer() : nil
                        MessageView(msg)
                        msg.sender_id == user.id ? nil : Spacer()
                    }
                    .padding()

                }
            }
        
            HStack {
                TextField("Type a message...", text: $currMsg)
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.primary, lineWidth:1)
                    }
                Button("Send") {
                    Task {
                        do {
                            try await supabase.from("messages").insert(["sender_id": user.id.uuidString, "recipient_id": contact.id.uuidString, "content": currMsg]).execute()
                            currMsg = ""
                            print("Message sent successfully: \(currMsg)")
                        } catch {
                            print("Message sending error: \(error)")
                        }
                    }

                }
            }
            .padding()

                


            
        }
        .navigationTitle(contact.name)

    }
}

