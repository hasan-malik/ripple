//
//  RippleApp.swift
//  Ripple
//
//  Created by Hasan Malik on 2026-02-24.
//

import SwiftUI

@main
struct RippleApp: App {
    
    // now this is really interesting. Profile is an observable class, so any changes to the <user> object
    // will cause a rerender.
    // so why do we need @State?
    // because *when we reassign <user>*, we also need a rerender!
    // and for that, we need @State.
    @State private var user: Profile? = nil
    @State private var realtimeMessaging: RealtimeMessaging? = nil

    var body: some Scene {
        WindowGroup {
            let _ = print("rerendered!")
            // "if let" syntax is the glory of the Swift programming language.
            if let user = user, let realtimeMessaging = realtimeMessaging {
                MainView()
                    .environment(user)
                    .environment(realtimeMessaging)
                    .task {
                        await realtimeMessaging.startListening()
                    }
            } else {
                NavigationStack{
                    LoginView(user: $user, realtimeMessaging: $realtimeMessaging)
                    // on successful login, update <user>, so that we can enter MainView.
                }
                
            }
        }
    }
}

//    let user = Profile("Imran", "imran@email.com")
//
//    init() {
//        user.addContact(Contact("Javaid"))
//        user.contacts[user.contacts.count - 1].addMessage(Message("Imran", "Javaid", "Hello Javaid!"))
//        user.addContact(Contact("Yaqoob"))
//        user.addContact(Contact("Ikrimah"))
//        user.addContact(Contact("Habib"))
//    }
