//
//  ListOfJokes.swift
//  ChuckNorrisJokeApp
//
//  Created by HubertMac on 21/05/2024.
//

import SwiftUI

struct ListOfJokes: View {
    
    @EnvironmentObject var model: ContentModel
    @Binding var show: Bool
    @Binding var jokeToShow: String
    
    var body: some View {
        List {
            ForEach($model.favoriteJokes, id: \.self) { $item in
                Text(item)
                    .lineLimit(2)
                    .onTapGesture {
                        jokeToShow = item
                        show.toggle()
                    }
            }
            .onDelete { offsets in
                model.favoriteJokes.remove(atOffsets: offsets)
            }
        }
        .listStyle(.inset)
    }
}
