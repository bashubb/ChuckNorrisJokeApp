//
//  ContentView.swift
//  ChuckNorrisJokeApp
//
//  Created by HubertMac on 21/06/2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    @State var joke: String?
    
    var body: some View {
        VStack(spacing:20) {
            Text("Chuck Norris Joke app")
                .font(.title)
        
            if joke != nil {
                Text(joke!)
                    .foregroundColor(.white)
                    .padding()
                    .background(.gray)
                    .opacity(0.8)
                    .cornerRadius(10)
                    .animation(.easeInOut, value: joke)
                    
                
                
            }
            
            Button("Get Joke", action: {
                model.getRemoteData()
                self.joke = model.joke?.value
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
