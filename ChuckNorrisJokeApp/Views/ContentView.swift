//
//  ContentView.swift
//  ChuckNorrisJokeApp
//
//  Created by HubertMac on 21/06/2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    
    var body: some View {
        VStack {
            Text("Chuck Norris Joke app")
                .font(.title)
            
            if model.joke != nil {
                Text(model.joke!.value)
            }
            
            Button("Get Joke", action: model.getRemoteData)
            
            
            
            
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ContentModel())
    }
}
