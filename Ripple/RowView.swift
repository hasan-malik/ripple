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
                .frame(width: 75, height: 75)
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title)
                Text(lastMessage)
                    
            }.padding()
            
        }
        .frame(maxHeight: 90)

    }
}

#Preview {
    List {
        
    }

}
