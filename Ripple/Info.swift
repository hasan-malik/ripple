//
//  Info.swift
//  Ripple
//
//  Created by Hasan Malik on 2026-02-24.
//

import Foundation

@Observable
class Profile {
    
    var id: UUID
    var name: String
    var email: String
    var contacts: [Contact]
    
    init(_ id: UUID, _ name: String, _ email: String) {
        
        self.id = id;
        self.name = name;
        self.email = email;
        self.contacts = []
        
    }
    
    func addContact(_ contact: Contact) {
        contacts.append(contact)
    }

}

@Observable
class Contact: Identifiable {
    
    var name: String
    var previousMessages: [Message]
    
    init(_ name: String, _ initialMessages: [Message] = []){
        self.name = name
        self.previousMessages = initialMessages
    }
    
    func addMessage(_ msg: Message) {
        previousMessages.append(msg)
    }
 
}

class Message: Identifiable {
    var sender: String;
    var recipient: String;
    var content: String;
    
    
    init(_ sender: String, _ recipient: String, _ content: String) {
        self.sender = sender;
        self.recipient = recipient;
        self.content = content;
    }
}
