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
                    .stroke(Color.black)
                    
                    // Yellow line on top of the Tab bar
                    Rectangle()
                        .foregroundColor(.yellow)
                        .offset(x: selectedTab == Tab.Jokes ? -(geo.size.width / 4) : geo.size.width / 4 , y: -5)
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
