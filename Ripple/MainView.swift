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
    
    return MainView()
        .environment(user)
}
