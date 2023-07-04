//
//  JokeDetailView.swift
//  ChuckNorrisJokeApp
//
//  Created by HubertMac on 04/07/2023.
//

import SwiftUI

struct JokeDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var joke: String
    
    var body: some View {
        VStack {
            Text(joke)
                .foregroundColor(.white)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20)
                    .fill(Color.gray.opacity(0.5))
                    .shadow(color: Color.gray, radius: 8))
                .contextMenu {
                    Button {
                        model.favoriteJokes.append(joke)
                    } label: {
                        
                        Text("Add to favorite")
                        Image(systemName: "heart")
                    }
                    
                    ShareLink(item: joke)
                    
                    
                }
        }
    }
    
}
