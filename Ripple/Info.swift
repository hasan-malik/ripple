//
//  Info.swift
//  Ripple
//
//  Created by Hasan Malik on 2026-02-24.
//

import Foundation

class Profile {
    var name: String
    private var contacts: [Contact]
    
    init(_ name: String) {
        
        self.name = name;
        self.contacts = []
        
    }
    
    func addContact(_ contact: Contact) {
        contacts.append(contact)
    }

}

class Contact {
    
    var name: String
    private var previousMessages: [Message]
    
    init(_ name: String){
        self.name = name
        self.previousMessages = []
    }
    
    func addMessage(msg: Message) {
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
