//
//  JokeDetailView.swift
//  ChuckNorrisJokeApp
//
//  Created by HubertMac on 04/07/2023.
//

import SwiftUI

struct JokeDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
    @State var isAlertShowing = false
    
    var joke: String
    
    var body: some View {
        VStack {
            Text(joke)
                .foregroundColor(.primary)
                .padding()
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .contextMenu {
                    Button {
                        if !model.favoriteJokes.contains(joke) {
                            model.favoriteJokes.append(joke)
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
    }
    
}
