//
//  WelcomeView.swift
//  ChuckNorrisJokeApp
//
//  Created by HubertMac on 05/07/2023.
//

import SwiftUI

struct WelcomeView: View {
    
    @State private var expand = false
    
    var body: some View {
        ZStack {
            Color(red: 0.23, green: 0.191, blue: 0.204)
                .ignoresSafeArea()
            VStack {
                Image("chuck")
                    .resizable()
                    .scaledToFill()
                    .onAppear {
                        expand.toggle()}
                    .animation(.easeIn, value: expand)
            }
            .statusBarHidden(true)
            .padding(30)
            
            
            
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
