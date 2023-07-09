//
//  FavoriteJokesView.swift
//  ChuckNorrisJokeApp
//
//  Created by HubertMac on 02/07/2023.
//

import SwiftUI

struct FavoriteJokesView: View {
    
    @EnvironmentObject var model: ContentModel
    @Namespace var namespace
    
    @State var jokeToShow = ""
    @State var show = false
    
    var body: some View {
        ZStack {
            
            
            
            
            VStack {
                
                List {
                    Section {
                        ForEach($model.favoriteJokes, id: \.self) { $item in
                            Text(item)
                                .onTapGesture {
                                        jokeToShow = item
                                        show.toggle()
                                }
                        }
                        .onDelete { offsets in
                            model.favoriteJokes.remove(atOffsets: offsets)
                        }
                    } header: {
                        Text("Your Favorite Jokes")
                            .padding()
                            .frame(maxWidth:.infinity)
                            .background(Color.yellow.opacity(0.5))
                    }
                }
                .listStyle(.inset)
                

                
            }
            .blur(radius: show ? 10 : 0)
            
            if show {
                
                VStack (spacing: 15) {
                    HStack(spacing: 30) {
                        
                        // Delete joke from the list
                        Button {
                            
                        } label: {
                            HStack {
                                Image(systemName: "trash")
                                Text("Delete")
                            }
                        }
                        
                        // Share joke in text message etc
                        ShareLink(item: jokeToShow)
                    }
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    Divider()
                    
                    Text(jokeToShow)
                    
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(.ultraThinMaterial))
                .padding()
                .transition(.slide)
                .zIndex(1)
                .onTapGesture( perform: {
                        self.show = false
                    })
            }
                
            
        }
        .animation(.default, value:show)
        
        
        
        
    }
    
}


struct FavoriteJokesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteJokesView()
            .environmentObject(ContentModel())
    }
}
