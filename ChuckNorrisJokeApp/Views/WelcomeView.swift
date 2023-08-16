//
//  WelcomeView.swift
//  ChuckNorrisJokeApp
//
//  Created by HubertMac on 05/07/2023.
//

import SwiftUI

struct WelcomeView: View {
    
    @State private var move = false
    
    var body: some View {
        
        
        ZStack {
            MainTabView()
                .environmentObject(ContentModel())
            
            ZStack {
                Color.white
                    .ignoresSafeArea()
                
                VStack {
                    Image("chucknorris")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                
            }
            .offset(x: 0, y: move ? -1000 : 0)
            .onAppear {
                
                move = true
            }
        }
        
        .animation(.easeOut(duration: 1.5).delay(3), value: move)
        
        
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}


