//
//  ContentView.swift
//  ChuckNorrisJokeApp
//
//  Created by HubertMac on 21/06/2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    @State var jokeOnScreen = ""
    @State var jokeIsShowing = false
    
    
    var body: some View {
        VStack(spacing:20) {
            
            Text("Chuck Norris Joke app")
                .font(.title)
            
            if jokeIsShowing {
                
                    JokeDetailView(joke:jokeOnScreen)
                
            }
            
            Button("Get Joke", action: {
                model.getRemoteData {
                    withAnimation {
                        guard model.joke != nil else{return}
                        self.jokeOnScreen = model.joke?.value ?? ""
                        self.jokeIsShowing = true
                    }
                }
            })
            .buttonStyle(.borderedProminent)
            
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
