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
        VStack {
            
            Text("Chuck Norris Joke app")
                .font(.title)
                .foregroundColor(.white)
                .shadow(radius: 3)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.yellow)
             
            Spacer()
            
            VStack(spacing:40) {
            
                if jokeIsShowing {
                    JokeDetailView(joke:jokeOnScreen)
                        .padding()
                }
                
                
                Button {
                    model.getRemoteData {
                        
                        guard model.joke != nil else{return}
                        self.jokeOnScreen = model.joke?.value ?? ""
                        self.jokeIsShowing = true
                        
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
            .ignoresSafeArea()
            .animation(.default, value: jokeOnScreen)
            .font(.title2)
            
            Spacer()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ContentModel())
    }
}
