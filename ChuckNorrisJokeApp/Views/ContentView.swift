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
                    .font(.title.weight(.semibold))
                    .fontDesign(.monospaced)
                    .fixedSize()
                    .foregroundColor(.primary)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 85)
                    .background(.ultraThickMaterial)
                Rectangle()
                    .fill(Color.secondary.opacity(0.2))
                    .frame(height: 4)
            }
            
            // Category picker
            
            VStack(alignment: .leading){
                Text("Choose Joke category")
                    .font(.callout.weight(.thin))
                    .padding(8)
                    .padding(.horizontal)
                    .background(.ultraThickMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Picker("choose category", selection: $model.choosenCategory) {
                            ForEach(model.categories, id:\.self){ data in
                                Text(data)
                            }
                        }
                        .tint(Color.gray)
                        .labelsHidden()
                    .pickerStyle(.menu)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.ultraThickMaterial.opacity(0.3) ,in: RoundedRectangle(cornerRadius: 10))
            .overlay(
                Rectangle().stroke(Color.secondary.opacity(0.1), lineWidth: 3))
            
            
            
            
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




