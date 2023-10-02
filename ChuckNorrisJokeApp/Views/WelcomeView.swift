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
            
            GeometryReader  { geo in
                ZStack {
                    HStack(spacing:0){
                        Rectangle()
                            .offset(x: move ? -(geo.size.width / 2) : 0 , y: 0)
                            .fill(Color.black)
                        Rectangle()
                            .offset(x: move ? geo.size.width / 2 : 0, y: 0)
                            .fill(Color.black)
                    }
                    .ignoresSafeArea()
                    .animation(.easeOut.delay(3.3), value: move)
                    
                    VStack {
                        Image("chucknorris")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .opacity(move ? 0 : 1)
                    }
                    .animation(.easeOut(duration: 1.5).delay(2), value: move)
                    
                }
                .onAppear {
                    move = true
                }
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}


