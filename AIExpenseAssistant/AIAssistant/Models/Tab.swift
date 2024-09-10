//
//  Tab.swift
//  Custom Tab Bar
//
//  Created by Balaji on 08/05/23.
//

import SwiftUI

/// App Tab's
enum Tab: String, CaseIterable {
    case home = "Home"
    case ai = "AI Assistant"
    case eye = "Receipt"
    
    var systemImage: String {
        switch self {
        case .home:
            return "house"
        case .ai:
            return "waveform"
        case .eye:
            return "eye"

        }
    }
    
    var index: Int {
        return Tab.allCases.firstIndex(of: self) ?? 0
    }
}
