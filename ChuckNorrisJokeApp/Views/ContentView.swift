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
        VStack(spacing:0) {
            
            // Header
            VStack(spacing: 0) {
                Text("Chuck Norris JokeApp")
                    .modifier(Title())
                Rectangle()
                    .fill(Color.secondary.opacity(0.2))
                    .frame(height: 4)
            }
            
            // Category picker
            
            VStack(spacing:0){
                VStack {
                    Text("Choose Joke category")
                        .font(.callout.weight(.thin))
                        .padding(.top, 10)
                        .padding(.horizontal)
                    Divider()
                    Picker("choose category", selection: $model.choosenCategory) {
                        ForEach(model.categories, id:\.self){ data in
                            Text(data)
                        }
                    }
                    .padding(.bottom, 6)
                    .tint(Color.gray)
                    .labelsHidden()
                }
                .background(.ultraThickMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.ultraThickMaterial.opacity(0.3) ,in: RoundedRectangle(cornerRadius: 10))
            
                
            
            
            
            
            Spacer()
            
            VStack(spacing:40) {
                
                // Joke Field
                if jokeIsShowing {
                    JokeDetailView(joke:jokeOnScreen)
                        .padding()
                        .transition(.scale(scale: 0.5))
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
            .animation(.interactiveSpring(response: 0.8, dampingFraction: 0.6).speed(1.2), value: jokeOnScreen)
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


struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title.weight(.semibold))
            .fontDesign(.monospaced)
            .fixedSize()
            .foregroundColor(.primary)
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 85)
            .background(.ultraThickMaterial)
        
    }
    
    
}

