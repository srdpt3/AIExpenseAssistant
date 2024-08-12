//
//  ContentView.swift
//  AIExpenseAssistant
//
//  Created by Dustin Yang on 8/4/24.
//

import SwiftUI

struct ContentView: View {
    
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
          TabView {
              NavigationStack {
                  LogListContainerView(vm: $vm)
              }
              .tabItem {
                  Label("지출", systemImage: "tray")
              }.tag(0)
              
              NavigationStack {
                  Text("AI Assistant")
//                  AIAssistantView()
              }
              .tabItem {
                  Label("AI 비서", systemImage: "waveform")
              }.tag(1)
              
              NavigationStack {
                  Text("영수증 스캔")

//                  ExpenseReceiptScannerView()
              }
              .tabItem {
                  Label("영수증 스캔", systemImage: "eye")
              }.tag(2)
          }
      }
      
      var splitView: some View {
          NavigationSplitView {
              List {
                  NavigationLink(destination: LogListContainerView(vm: $vm)) {
                      Label("Expenses", systemImage: "tray")
                  }
                  
                  NavigationLink(destination: Text("AI 비서")) {
                      Label("AI Assistant", systemImage: "waveform")
                  }
                  
                  NavigationLink(destination: Text("영수증 스캔")) {
                      Label("Receipt Scanner", systemImage: "eye")
                  }
                  
              }
          } detail: {
              LogListContainerView(vm: $vm)
          }
          .navigationTitle("XCA AI Expense Tracker")
      }
}

#Preview {
    ContentView()
}
