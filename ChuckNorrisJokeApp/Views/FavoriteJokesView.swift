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
                ForEach($model.favoriteJokes, id: \.self) { $item in
                    Text(item)
                        .swipeActions {
                            Button {
                                model.favoriteJokes.remove(at: model.favoriteJokes.firstIndex(of: item)!)
                                self.isDeleted = true
                            } label: {
                                Image(systemName: isDeleted ? "trash" : "trash.fill")
                            }
                            .tint(isDeleted ? .green : .red)
                            
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
