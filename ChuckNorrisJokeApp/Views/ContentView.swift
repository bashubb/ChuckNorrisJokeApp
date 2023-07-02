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
                Text(jokeOnScreen)
                    .foregroundColor(.white)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20)
                        .fill(Color.gray.opacity(0.5)))
                    .contextMenu {
                        Button {
                            model.favoriteJokes.append(jokeOnScreen)
                        } label: {

                            Text("Add to favorite")
                            Image(systemName: "heart")
                        }
                        
                        ShareLink(item: jokeOnScreen)

                        
                    }
            }
            
            Button("Get Joke", action: {
                model.getRemoteData()
                self.jokeOnScreen = model.joke.value ?? ""
            })
            .buttonStyle(.borderedProminent)
            
            
        }.onChange(of: self.jokeOnScreen, perform: { newValue in
            if self.jokeOnScreen != "" {
                withAnimation {
                    self.jokeIsShowing = true
                }
            }
        })
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ContentModel())
    }
}
