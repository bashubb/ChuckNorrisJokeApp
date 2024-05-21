//
//  MainTabView.swift
//  ChuckNorrisJokeApp
//
//  Created by HubertMac on 02/07/2023.
//

import SwiftUI

enum Tab {
    case Jokes
    case Favorite
}

struct TabInfo: Identifiable {
    var id = UUID()
    var view : Tab
    var icon : String
    var iconSelected: String
    var name : String
}

struct MainTabView: View {
    
    @State var tabs = [TabInfo]()
    @State var selectedTab = Tab.Jokes
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                switch(selectedTab) {
                case Tab.Jokes:
                    // Show Jokes
                    ContentView()
                case Tab.Favorite:
                    // Show Favorite Jokes
                    FavoriteJokesView()
                }
                
                Spacer()
                
                // Tab Bar
                VStack{
                    Path { path in
                        path.move(to: CGPoint(x: 0, y: 0))
                        path.addLine(to: CGPoint(x: geo.size.width, y: 0))
                    }
                    .stroke(Color.secondary)
                    
                    // Yellow line on top of the Tab bar
                    Rectangle()
                        .foregroundColor(.yellow)
                        .offset(x: selectedTab == Tab.Jokes ? -(geo.size.width / 4) : geo.size.width / 4 , y: -5).animation(.interactiveSpring(response: 0.8, dampingFraction:          0.5).speed(1.5), value: selectedTab)
                        .frame(width: geo.size.width / 2, height:5)
                        
                        
                    // Tab bar buttons 
                    HStack(spacing: 0) {
                        Spacer()
                        ForEach(tabs) { tab in
                            CustomTabBarButton(selectedTab: $selectedTab, tab: tab)
                                .frame(width: (geo.size.width - 40 ) / 2)
                        }
                        Spacer()
                    }
                }
                .background(Rectangle().fill(.ultraThickMaterial).ignoresSafeArea())
                .frame(height: 70)
                .animation(.default, value: selectedTab)
            }
        }
        .onAppear {
            //Create tabs
            var newTabs = [TabInfo]()
            newTabs.append(TabInfo(view: Tab.Jokes, icon: "smiley", iconSelected: "smiley.fill", name: "Jokes"))
            newTabs.append(TabInfo(view: Tab.Favorite, icon: "heart", iconSelected: "heart.fill", name: "Favorite"))
            tabs = newTabs
        }    
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}


