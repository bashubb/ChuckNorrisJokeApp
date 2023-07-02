//
//  FavoriteJokesView.swift
//  ChuckNorrisJokeApp
//
//  Created by HubertMac on 02/07/2023.
//

import SwiftUI

struct FavoriteJokesView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var isDeleted = false
    
    var body: some View {
        VStack {
        
                List {
                    Section {
                        ForEach($model.favoriteJokes, id: \.self) { $item in
                            Text(item)
                        }
                        .onDelete { offsets in
                            model.favoriteJokes.remove(atOffsets: offsets)
                        }
                    }
                }
            
        }
    }
}

struct FavoriteJokesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteJokesView()
            .environmentObject(ContentModel())
    }
}
