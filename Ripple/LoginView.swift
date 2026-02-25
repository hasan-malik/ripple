//
//  Welcome.swift
//  Ripple
//
//  Created by Hasan Malik on 2026-02-24.
//

import SwiftUI
internal import Auth
import Supabase

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showErrorMessage = false;

    
    var body: some View {
        VStack{
            Text("Welcome to Ripple")
                .font(.largeTitle)
                .padding()
            Text("Invalid email or password")
                .font(.title)
                .foregroundStyle(showErrorMessage ? .red : .clear)
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
            
            Button("Log In") {
                Task {
                    do {
                        let session = try await supabase.auth.signIn(email: email, password: password)
                        print("Logged in! Session: \(session)")
                        showErrorMessage = false;
                        
                    } catch {
                        print("Login error: \(error)")
                        showErrorMessage = true;
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
    

}

#Preview {

    LoginView()
}

