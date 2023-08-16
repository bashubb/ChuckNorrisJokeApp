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
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.yellow)
                .shadow(radius: 3)
             
            Spacer()
            
            VStack(spacing:40) {
            
                if jokeIsShowing {
                    JokeDetailView(joke:jokeOnScreen)
                        .padding()
                }
                
                
                Button("Get Joke") {
                    model.getRemoteData {
                        
                        guard model.joke != nil else{return}
                        self.jokeOnScreen = model.joke?.value ?? ""
                        self.jokeIsShowing = true
                        
                    }
                }
                .buttonStyle(CustomButtonStyle())
                .padding()
                
                
                
                
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


struct CustomButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(configuration.isPressed ? Color.yellow : Color.gray)
                .frame(height: 50)
            
            configuration.label
                .foregroundColor(.white)
        }
        .shadow(radius: 8)
        .scaleEffect(configuration.isPressed ? 0.96 : 1)
        .animation(.easeOut, value: configuration.isPressed)
        
    }
}
