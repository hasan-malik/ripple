//
//  RowView.swift
//  Ripple
//
//  Created by Hasan Malik on 2026-02-24.
//

import SwiftUI

struct RowView: View {
    private var name: String;
    private var lastMessage: String;
    
    init(_ name: String, _ lastMessage: String) {
        self.name = name;
        self.lastMessage = lastMessage;
    }
    
    var body: some View {
        HStack {
            Circle()
                .frame(width: 100, height: 100)
            VStack(alignment: .leading) {
                Text(name)
                    .font(.headline)
                Text(lastMessage)
                    
            }
            
        }

    }
}

#Preview {
    List {
        RowView("Jake", "Are you coming to class?")
    }

}
