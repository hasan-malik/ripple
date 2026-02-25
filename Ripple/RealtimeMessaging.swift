//
//  RealtimeMessaging.swift
//  Ripple
//
//  Created by Hasan Malik on 2026-02-25.
//

import Foundation
import Realtime
import Supabase


@Observable
class RealtimeMessaging {
    var user: Profile
    
    init(for user: Profile) {
        self.user = user
    }
    
    func startListening() async {
        print("Realtime listening for messages")
        
        let channel = supabase.realtimeV2.channel("MyChannel")
        print("1")
        let stream = channel.postgresChange(AnyAction.self, schema: "public", table: "messages")
        // first argument: the type of actions you're listerning for: InsertAction.self, UpdateAction.self, DeleteAction.self, or AnyAction.self
        
        print("2")
        do {
            print("3")
            try await channel.subscribeWithError() // start listening to the channel
            print("4")
            for await change in stream {
                // now, <change> has the type of the first argument to postgresChange
                // so for us, <change> is of type AnyAction
                // AnyAction is an enum
                // the .record or .oldRecord attribute is the row of the table
                print("5: change: \(change)")
                switch change {
                case .insert(let change):
                        print("inserted:", change.record)
                case .delete(let change):
                        print("deleted:", change.oldRecord)
                case .update(let change):
                        print("updated:", change.record)
                }
                print("6")
                
            }
        } catch {
            print("Realtime messaging error: \(error)")
        }
        

    }
}
