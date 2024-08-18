//
//  AlAssitantView.swift
//  AIExpenseAssistant
//
//  Created by Dustin Yang on 8/13/24.
//

import SwiftUI
import ChatGPTUI

let apiKey=""
let _senderImage = "profile.png"
let _botImage = "pepe"
enum ChatType: String, Identifiable, CaseIterable {
    case text = "텍스트"
    case voice = "음성"
    var id: Self { self }
}

struct AlAssitantView: View {
    @State var textChatVM = AIAssistantTextChatViewModel(apiKey: apiKey)
    @State var chatType  = ChatType.text
    
    var body: some View {
        VStack(spacing: 0) {
            Picker(selection: $chatType, label: Text("Chat Type").font(.system(size: 12, weight: .bold))) {
                ForEach(ChatType.allCases) { type in
                    Text(type.rawValue).tag(type)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            
#if !os(iOS)
            .padding(.vertical)
#endif
            
            Divider()
            
            ZStack {
                switch chatType {
                case .text:
                    TextChatView(customContentVM: textChatVM)
//                    TextChatView(senderImage: _senderImage, botImage: _botImage, apiKey: apiKey)
                case .voice:
                    VoiceChatView(apiKey: apiKey)
                }
            }.frame(maxWidth: 1024, alignment: .center)
        }
#if !os(macOS)
        .navigationBarTitle("AI 가계부 비서", displayMode: .inline)
#endif
    }
}

#Preview {
    AlAssitantView()
}
