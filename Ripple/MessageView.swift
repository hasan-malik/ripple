//
//  MessageView.swift
//  Ripple
//
//  Created by Hasan Malik on 2026-02-24.
//

import SwiftUI

class Message: Identifiable {
    private var sender: String;
    private var recipient: String;
    var content: String;
    
    
    init(_ sender: String, _ recipient: String, _ content: String) {
        self.sender = sender;
        self.recipient = recipient;
        self.content = content;
    }
}

struct MessageView: View {
    
    private var msg: Message;
    
    init(_ msg: Message) {
        self.msg = msg
    }
    
    var body: some View {
        Text(msg.content)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.secondary, lineWidth: 1)
            }
    }
}

#Preview {
    MessageView(Message("Hasan", "Ricky", "Hi, I'm Hasan!"))
}
