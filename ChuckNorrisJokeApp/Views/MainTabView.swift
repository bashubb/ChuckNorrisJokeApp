//
//  MainTabView.swift
//  ChuckNorrisJokeApp
//
//  Created by HubertMac on 02/07/2023.
//

import SwiftUI

struct MainTabView: View {
    
    @State var selectedView = 0
    
    var body: some View {
        
        TabView(selection: $selectedView) {
            // First tab
            VStack {
                ContentView()
            }
            .tabItem {
                VStack {
                    Image(systemName: "face.smiling")
                    Text("Jokes")
                    
                }
                
            }.tag(0)
            
            //Second tab
            VStack {
                FavoriteJokesView()
            }
            .tabItem {
                Image(systemName: "heart")
                Text("favorite")
                
            }.tag(1)
            
        }.accentColor(.yellow)
        
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
