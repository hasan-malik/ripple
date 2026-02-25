//
//  Welcome.swift
//  Ripple
//
//  Created by Hasan Malik on 2026-02-24.
//

import SwiftUI

struct Welcome: View {
    
    @State private var email: String = ""
    @State private var password: String = ""

    
    var body: some View {
        Text("Welcome to Ripple")
            .font(.largeTitle)
        TextField("email", text: $email)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.primary, lineWidth: 1)
            }
            .padding()
        TextField("password", text: $password)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.primary, lineWidth: 1)
            }
            .padding()
        
        Button("Continue") {
            
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.primary, lineWidth: 1)
        }
    }
    

}

#Preview {

    Welcome()
}

