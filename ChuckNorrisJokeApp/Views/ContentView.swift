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
            
            // Header
        
                Text("Chuck Norris Joke app")
                        .font(.title)
                        .foregroundColor(.primary)
                        .padding()
                        .frame(maxWidth: .infinity)
                        
                    .background(.ultraThinMaterial)
          
                    
            HStack {
                
                Text("Pick the joke category")
                
                Picker("choose category", selection: $model.choosenCategory) {
                    ForEach(model.categories, id:\.self){ data in
                        Text(data)
                    }
                }
            }
            
            
             
            Spacer()
            
            VStack(spacing:40) {
            
                // Joke Field
                if jokeIsShowing {
                    JokeDetailView(joke:jokeOnScreen)
                        .padding()
                }
                
                // Button to fetch data
                Button("Get Joke") {
                    Task {
                        await model.getRemoteData()
                        }
                }
                .buttonStyle(CustomButtonStyle())
                .padding()
                
            }
            .ignoresSafeArea()
            .animation(.default, value: jokeOnScreen)
            .font(.title2)
            .onReceive(model.$jokeValue){ [data = model.jokeValue] newData in
                            if data == newData {
                                return
                            } else {
                                jokeOnScreen = newData
                                jokeIsShowing = true
                            }
                        }
            
            Spacer()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(ContentModel())
    }
}


// Custom Button
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
