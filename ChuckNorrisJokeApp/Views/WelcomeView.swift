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
        VStack {
            
            if expand {
                Image("chucknorris")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .transition(.slide)
                    
            }
        }
        .onAppear {
            withAnimation(.spring()) {
                expand.toggle()
            }
        }
                        
            
            
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
