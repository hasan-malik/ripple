//
//  ContentView.swift
//  Ripple
//
//  Created by Hasan Malik on 2026-02-24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
        
            Text("Welcome to Ripple")
            Text("Login:")
            
            TextField("m@example.com", text: .constant(""))
                .textContentType(.username)
                .textFieldStyle(.automatic)
            
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
