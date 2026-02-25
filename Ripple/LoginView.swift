//
//  Welcome.swift
//  Ripple
//
//  Created by Hasan Malik on 2026-02-24.
//

import SwiftUI
internal import Auth
import Supabase

struct FetchedProfileData: Codable {
    var name: String;
    var email: String;
    var id: UUID;
}

struct FetchedContactsData: Codable {
    var profile_id: UUID;
    var contact_id: UUID;
    var saved_name: String;
}

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showErrorMessage = false;
    
    @Binding var user: Profile?;

    
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
            SecureField("password", text: $password)
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
                        
                        let currentEmail = session.user.email;
                        
                        let correspondingUsers: [FetchedProfileData] = try await supabase.from("profiles").select().eq("email", value: currentEmail).execute().value
                        // the .execute() query returns an array containing json for the matching rows in the public.profiles table
                        // obviously, in our program,0 <= the length of returned array <= 1
                        // .value decodes the json into FetchedProfileData objects. this is why FetchedProfileData had to conform to Codable. Note that for this to work, it is imperative that the names of the columns in our public.profiles table match the names of the attributes of FetchedProfileData
                        
                        // just a note: in your above query, you compare by email.
                        // that's fine—comparing by id would've been more "professional"-esque, though
                        // you can access the id via session.user.id
                        
                        if let matchedUser = correspondingUsers.first {
                            user = Profile(matchedUser.id, matchedUser.name, matchedUser.email)
                            // now, let's add all the Supabase contacts to the <user> object
                            let contacts: [FetchedContactsData] = try await supabase.from("contacts").select().equals("profile_id", value: matchedUser.id.uuidString).execute().value
                            
                            contacts.forEach{ contact in
                                print("Adding contact id: \(contact.contact_id)")
                                user?.addContact(Contact(contact.saved_name, []))
                                
                            }
                        }
                        
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
            NavigationLink(destination: SignupView(user: $user)) {
                Text("New to Ripple? Sign up")
                    .font(.body)
                    .padding()
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    @Previewable @State var user: Profile? = nil
    NavigationStack{
        LoginView(user: $user)
    }
}

