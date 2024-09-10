//
//  BlurryBackgroundView.swift
//  AIExpenseAssistant
//
//  Created by Dustin Yang on 9/5/24.
//
import SwiftUI

struct BlurryBackgroundView: View {
    var body: some View {
        GeometryReader { geometry in
            Image("background") // Replace with your image name
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .blur(radius: 10)
                .overlay(Color.black.opacity(0.2)) // Adds a slight darkening effect
        }
        .edgesIgnoringSafeArea(.all)
    }
}
#Preview {
    BlurryBackgroundView()
}
