//
//  Welcome.swift
//  Ripple
//
//  Created by Hasan Malik on 2026-02-24.
//

import SwiftUI

struct Welcome: View {
    
    private var user: Profile
    
    init(_ user: Profile){
        self.user = user
    }
    
    var body: some View {
        Text("Welcome, \(user.name)")
            .font(.largeTitle)
    }
}

#Preview {
    let user = Profile("Imran")
    Welcome(user)
}

