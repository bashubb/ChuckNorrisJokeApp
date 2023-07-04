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
        VStack(spacing:40) {
            
            Text("Chuck Norris Joke app")
                .font(.title)
            
            if jokeIsShowing {
                
                    JokeDetailView(joke:jokeOnScreen)
                
            }
            
            
            Button {
                model.getRemoteData {
                    withAnimation {
                        guard model.joke != nil else{return}
                        self.jokeOnScreen = model.joke?.value ?? ""
                        self.jokeIsShowing = true
                    }
                }
            } label: {
                Text("Get Joke")
                    .foregroundColor(.white)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 15)
                    .background(RoundedRectangle(cornerRadius: 8)
                        .fill(Color.blue)
                        .shadow(radius: 5))
            }
            

            
        }
        .padding()
        .font(.title2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ContentModel())
    }
}
