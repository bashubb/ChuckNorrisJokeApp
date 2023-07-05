//
//  FavoriteJokesView.swift
//  ChuckNorrisJokeApp
//
//  Created by HubertMac on 02/07/2023.
//

import SwiftUI

struct FavoriteJokesView: View {
    
    @EnvironmentObject var model: ContentModel
   
    @State var jokeToShow = ""
    @State var show = false
    
    var body: some View {
        ZStack {
            VStack {
            
                    List {
                        Section {
                            ForEach($model.favoriteJokes, id: \.self) { $item in Text(item)
                                    .onTapGesture {
                                        withAnimation {
                                            jokeToShow = item
                                            show = true
                                        }
                                    }
                            
                            }
                            .onDelete { offsets in
                                model.favoriteJokes.remove(atOffsets: offsets)
                            }
                        }
                    }
                
            }.blur(radius: show ? 10 : 0)
            
            if show {
                VStack {
                    HStack {
                        Button {
                            
                        } label: {
                            HStack {
                                Image(systemName: "trash")
                                Text("Delete from favorites")
                            }
                        }
                        
                        ShareLink(item: jokeToShow)


                    }
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    Divider()
                    
                    Text(jokeToShow)
                    
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(.ultraThinMaterial))
                .transition(.slide)
                .padding()
                .gesture(DragGesture()
                    .onChanged({ value in
                        withAnimation {
                            self.show = false
                        }
                        
                    }))
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
