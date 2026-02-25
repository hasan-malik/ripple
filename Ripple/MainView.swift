//
//  MainView.swift
//  Ripple
//
//  Created by Hasan Malik on 2026-02-24.
//

import SwiftUI


struct MainView: View {
    var body: some View {
        List{
            RowView("Jake", "Are you coming to class?")
            RowView("Matthew", "Yoooo")
        }
    }
}

#Preview {
    MainView()
}
