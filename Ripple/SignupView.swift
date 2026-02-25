//
//  SignupView.swift
//  Ripple
//
//  Created by Hasan Malik on 2026-02-25.
//


//
//  Welcome.swift
//  Ripple
//
//  Created by Hasan Malik on 2026-02-24.
//

import SwiftUI
internal import Auth
import Supabase

struct SignupView: View {
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""

    
    var body: some View {
        Text("Welcome to Ripple")
            .font(.largeTitle)
        TextField("name", text: $name)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.primary, lineWidth: 1)
            }
            .padding()
        TextField("email", text: $email)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.primary, lineWidth: 1)
            }
            .padding()
        SecureField("password", text: $password)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.primary, lineWidth: 1)
            }
            .padding()
        
        Button("Sign Up") {
            Task { // task is like async in react!
                do {
                    try await supabase.auth.signUp(email: email, password: password)    
                } catch {
                    print("Error occured in sign up")
                }
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.primary, lineWidth: 1)
        }
    }
    

}

#Preview {

    SignupView()
}

