//
//  RippleApp.swift
//  Ripple
//
//  Created by Hasan Malik on 2026-02-24.
//

import SwiftUI

@main
struct RippleApp: App {
    
    let user = Profile("Imran", "imran@email.com")
    
    init() {
        user.addContact(Contact("Javaid"))
        user.contacts[user.contacts.count - 1].addMessage(Message("Imran", "Javaid", "Hello Javaid!"))
        user.addContact(Contact("Yaqoob"))
        user.addContact(Contact("Ikrimah"))
        user.addContact(Contact("Habib"))
    }

    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(user)
        }
    }
}
