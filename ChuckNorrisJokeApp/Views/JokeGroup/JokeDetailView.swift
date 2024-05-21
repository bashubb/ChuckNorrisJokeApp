//
//  JokeDetailView.swift
//  ChuckNorrisJokeApp
//
//  Created by HubertMac on 04/07/2023.
//

import SwiftUI

struct JokeDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
    @State private var isAlertShowing = false
    @State private var showOptions = false
    @State private var isAdded = false
    
    var joke: String
    
    var body: some View {
        VStack {
            Text(joke)
                .foregroundColor(.primary)
                .padding()
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .onTapGesture(count: 2){
                    showOptions = true
                }
                .confirmationDialog("Do what You want!", isPresented: $showOptions){
                    Button {
                        if !model.favoriteJokes.contains(joke) {
                            model.favoriteJokes.append(joke)
                            isAdded = true
                        } else {
                            isAlertShowing = true
                        }
                    } label: {
                        Text("Add to favorite")
                        Image(systemName: "heart")
                    }
                    ShareLink(item: joke)
                }
                
        }
        .alert("You have that joke", isPresented: $isAlertShowing) {
            Button("Ok",role: .cancel) {}
        } message: {
            Text("You already have that joke on your list, add another one!")
        }
        .alert("Joke added", isPresented: $isAdded) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("The joke has been added to your list!")
        }
    }
    
}
