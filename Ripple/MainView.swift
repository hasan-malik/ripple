//
//  MainView.swift
//  Ripple
//
//  Created by Hasan Malik on 2026-02-24.
//

import SwiftUI


struct MainView: View {
    
    @Environment(Profile.self) var user
    
    var body: some View {
        NavigationStack{
            VStack {
                Text("Main")
                    .font(.title)
                
                List(user.contacts){ contact in
                    NavigationLink(destination: ChatView(contact)) {
                        RowView(contact.name, contact.previousMessages.last?.content ?? "Start a conversation")
                    }
                    
                }
            }
        }
    }
}

#Preview {
    let user = Profile(UUID(), "Imran", "imran@email.com")
    user.addContact(Contact("Javaid"))
    user.contacts[user.contacts.count - 1].addMessage(Message("Imran", "Javaid", "Hello Javaid!"))
    user.contacts[user.contacts.count - 1].addMessage(Message("Javaid", "Imran", "Hello Imran!"))
    user.contacts[user.contacts.count - 1].addMessage(Message("Imran", "Javaid", "How are you"))
    user.contacts[user.contacts.count - 1].addMessage(Message("Javaid", "Imran", "I am fine"))

    user.addContact(Contact("Yaqoob"))
    user.addContact(Contact("Ikrimah"))
    user.addContact(Contact("Habib"))
    
    return MainView()
        .environment(user)
}
