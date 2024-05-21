//
//  PopUp.swift
//  ChuckNorrisJokeApp
//
//  Created by HubertMac on 21/05/2024.
//

import SwiftUI

struct PopUpJoke: View {
    
    @EnvironmentObject var model: ContentModel
    @Binding var show: Bool
    var jokeToShow: String
    
    var body: some View {
        VStack (spacing: 15) {
            HStack(spacing: 30) {
                
                // Delete joke from the list
                Button {
                    model.favoriteJokes.remove(at: (model.favoriteJokes.firstIndex(of: jokeToShow)!))
                    show = false
                } label: {
                    HStack {
                        Image(systemName: "trash")
                        Text("Delete")
                    }
                    .foregroundColor(.gray)
                }
                
                // Share joke in text message etc
                ShareLink(item: jokeToShow)
                    .foregroundColor(.gray)
            }
            .font(.caption)
            .frame(maxWidth: .infinity, alignment: .trailing)
            
            Divider()
            
            Text(jokeToShow)
            
        }
        
    }
}
