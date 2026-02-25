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
        List{
            RowView("Jake", "Are you coming to class?")
            RowView("Matthew", "Yoooo")
        }
    }
}

#Preview {
    let user = Profile("Imran")
    user.addContact(Contact("Javaid"))
    user.addContact(Contact("Yaqoob"))
    user.addContact(Contact("Ikrimah"))
    user.addContact(Contact("Habib"))
    return MainView(user)
}

