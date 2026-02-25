//
//  Info.swift
//  Ripple
//
//  Created by Hasan Malik on 2026-02-24.
//

import Foundation

class Profile {
    private var name: String
    private var contacts: [Contact]
    
    init(_ name: String) {
        
        self.name = name;
        self.contacts = []
        
    }

}

class Contact {
    
    private var previousMessages: [Message]
    
    init(){
        self.previousMessages = []
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
