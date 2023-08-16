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
                    .stroke(Color.gray)
                    
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
                
            }
            
            
        }
        .onAppear {
            //Create tabs
            var newTabs = [TabInfo]()
            newTabs.append(TabInfo(view: Tab.Jokes, icon: "smiley", name: "Jokes"))
            newTabs.append(TabInfo(view: Tab.Favorite, icon: "heart", name: "Favorite"))
            tabs = newTabs
        }
        
        
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

struct CustomTabBarButton: View {
    
    @Binding var selectedTab: Tab
    var tab : TabInfo
    
    
    var body: some View {
        VStack {
            if tab.view == selectedTab {
                
            }
            Image(systemName: tab.icon)
                .frame(height:20)
                .font(.title2)
                .padding(.bottom, 8)
            Text(tab.name)
                .font(.caption)
        }
        .padding(.vertical)
        .frame(height: 60)
        .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(tab.view == selectedTab ? Color.yellow.opacity(0.5) : Color.clear)
                        .frame(width: 80, height: 70)
                    
                        )
        
        .onTapGesture {
            selectedTab = tab.view
        }
        
        
    }
}
