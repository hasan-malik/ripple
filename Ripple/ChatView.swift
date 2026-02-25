//
//  ChatView.swift
//  Ripple
//
//  Created by Hasan Malik on 2026-02-24.
//

import SwiftUI

class Chat: Identifiable {
    private var sender: String;
    private var recipient: String;
    var content: String;
    
    
    init(_ sender: String, _ recipient: String, _ content: String) {
        self.sender = sender;
        self.recipient = recipient;
        self.content = content;
    }
}

struct ChatView: View {
    private var name: String;
    private var previousChats: [Chat];
    
    init(_ name: String, _ previousChats: [Chat]) {
        self.name = name
        self.previousChats = previousChats;
    }
    var body: some View {
        VStack {
            Text(name)
            ForEach(previousChats) { chat in
                Text(chat.content)
            }
        }

    }
}

#Preview {
    
    ChatView("Ricky", [])
}
