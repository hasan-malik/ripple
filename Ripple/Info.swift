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
    
    var id: UUID
    var name: String
    var previousMessages: [Message]
    
    init(_ id: UUID, _ name: String, _ initialMessages: [Message] = []){
        self.id = id;
        self.name = name
        self.previousMessages = initialMessages
    }
    
    func addMessage(_ msg: Message) {
        previousMessages.append(msg)
    }
 
}

class Message: Identifiable, Codable {
//    var sender: String;
//    var recipient: String;
//    var content: String;
//    
//    
//    init(_ sender: String, _ recipient: String, _ content: String) {
//        self.sender = sender;
//        self.recipient = recipient;
//        self.content = content;
//    }
    

    var sender_id: UUID;
    var recipient_id: UUID;
    var message_id: Int;
    var content: String;
    var created_at: Date;
    
    init(sender_id: UUID, recipient_id: UUID, message_id: Int, content: String, created_at: Date) {
            self.sender_id = sender_id;
            self.recipient_id = recipient_id
            self.content = content;
            self.created_at = created_at
            self.message_id = message_id;
    }
}
