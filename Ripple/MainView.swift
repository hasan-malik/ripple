//
//  MainView.swift
//  Ripple
//
//  Created by Hasan Malik on 2026-02-24.
//

import SwiftUI


struct MainView: View {
    
    private var user: Profile
    
    init(_ user: Profile){
        self.user = user
    }
    var body: some View {
        List(user.contacts){ contact in
            
            RowView(contact.name, contact.previousMessages.last?.content ?? "")
        }
    }
}

#Preview {
    let user = Profile("Imran")
    user.addContact(Contact("Javaid"))
    user.contacts[user.contacts.count - 1].addMessage(Message("Imran", "Javaid", "Hello Javaid!"))
    user.addContact(Contact("Yaqoob"))
    user.addContact(Contact("Ikrimah"))
    user.addContact(Contact("Habib"))
    
    return MainView(user)
}

