//
//  ContentView.swift
//  AIExpenseAssistant
//
//  Created by Dustin Yang on 8/4/24.
//

import SwiftUI

struct ContentView: View {
    @State private var activeTab: Tab = .home

    @State var vm = LogListViewModel()
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var body: some View {
        
        
#if os(macOS)
        splitView
#elseif os(visionOS)
        tabView
#else
        switch horizontalSizeClass {
        case .compact: tabView
        default: splitView
        }
#endif
    }
    
    var tabView: some View {
        TabView(selection: $activeTab) {
            NavigationStack {
                LogListContainerView(vm: $vm)
            }
            .tabItem {
                Label("Expense", systemImage: "tray")
            }.tag(Tab.home)
            
            NavigationStack {
                AlAssitantView()
            }
            .tabItem {
                Label("AI Assistant", systemImage: "waveform")
            }.tag(Tab.ai)
            
            NavigationStack {
                ExpenseReceiptScannerView()
            }
            .tabItem {
                Label("Receipt", systemImage: "eye")
            }.tag(Tab.eye)
        }   .overlay(SplashView())
    }
    
    
    var splitView: some View {
        NavigationSplitView {
            List {
                NavigationLink(destination: LogListContainerView(vm: $vm)) {
                    Label("Expenses", systemImage: "tray")
                }
                
                NavigationLink(destination: AlAssitantView()) {
                    Label("AI Assistant", systemImage: "waveform")
                }
                
                NavigationLink(destination: ExpenseReceiptScannerView()) {
                    Label("Receipt Scanner", systemImage: "eye")
                }
                
            }
        } detail: {
            LogListContainerView(vm: $vm)
        }
        .navigationTitle("AI 가계부 비서")
    }
    
}

#Preview {
    ContentView()
}
