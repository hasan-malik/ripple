//
//  RealtimeMessaging.swift
//  Ripple
//
//  Created by Hasan Malik on 2026-02-25.
//

import Foundation
import Realtime


@Observable
class RealtimeMessaging {
    var user: Profile
    
    init(for user: Profile) {
        self.user = user
    }
    
    func startListening() async {
        print("Realtime listening for messages")
    }
}
