//
//  AIExpenseAssistantApp.swift
//  AIExpenseAssistant
//
//  Created by Dustin Yang on 8/4/24.
//

import SwiftUI

@main
struct AIExpenseAssistantApp: App {
    
    #if os(macOS)
    @NSApplicationDelegateAdaptor private var appDelegate: AppDelegate
    #else
    @UIApplicationDelegateAdaptor private var appDelegate : AppDelegate
    #endif
    
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            #if os(macOS)
                .frame(minWidth: 729, minHeight: 480)
            #endif
        }
        
        #if os(macOS)
        .windowResizability(.contentMinSize)
        #endif
    }
}
