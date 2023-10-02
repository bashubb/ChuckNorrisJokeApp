//
//  SwiftUIView.swift
//  ChuckNorrisJokeApp
//
//  Created by HubertMac on 02/10/2023.
//

import SwiftUI

// Custom Button
struct CustomButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(configuration.isPressed ? Color.yellow : Color.gray)
                .frame(height: 50)
            configuration.label
                .foregroundColor(.white)
        }
        .scaleEffect(configuration.isPressed ? 0.96 : 1)
        .animation(.easeOut, value: configuration.isPressed)
        
    }
}


// Custom TabBar Button
struct CustomTabBarButton: View {
    
    @Binding var selectedTab: Tab
    var tab : TabInfo
    var isSelected: Bool {
        if tab.view == selectedTab {
            return true
        }
        else {
            return false
        }
    }
    
    var body: some View {
        VStack {
            // Tab button
            Image(systemName: isSelected ? tab.iconSelected :  tab.icon)
                .foregroundColor(isSelected ? (tab.iconSelected == "heart.fill" ? .red : .gray) : .gray)
                .frame(height:20)
                .font(.title2)
                .padding(.bottom, 8)
                .animation(.none, value: isSelected) // no animations
            Text(tab.name)
                .foregroundColor(isSelected ? .primary : .gray)
                .font(.caption)
                .animation(.none, value: isSelected) // no animations
        }
        .frame(height: 60)
        .animation(.easeInOut(duration: 0.8), value: isSelected)
        .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(isSelected ? Color.yellow.opacity(0.5) : Color.clear)
                        .frame(width: 80, height: 70)
                        )
        .onTapGesture {
            selectedTab = tab.view
        }
    }
}
