//
//  ChatView.swift
//  Ripple
//
//  Created by Hasan Malik on 2026-02-24.
//

import SwiftUI



struct ChatView: View {
    private var name: String;
    private var previousMessages: [Message];
    
    init(_ name: String, _ previousMessages: [Message]) {
        self.name = name
        self.previousMessages = previousMessages;
    }
    var body: some View {
        VStack {
            Text(name)
            ForEach(previousMessages) { msg in
                
                HStack {
                    msg.sender == "Hasan" ? Spacer() : nil
                    MessageView(msg)
                    msg.sender == "Hasan" ? nil : Spacer()
                }
                .padding()

            }
        }

    }
}

#Preview {
    let messages = [
        Message("Hasan", "Ricky", "Hi, I'm Hasan!"),
        Message("Ricky", "Hasan", "I'm Ricky!")
    ]
    ChatView("Ricky", messages)
}
