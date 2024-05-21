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
    @State private var isFavoritEmpty = false
    
    @GestureState private var popUpLocation = CGSize.zero
    
    var isFavoriteEmpty:Bool {
        if model.favoriteJokes.isEmpty {
            return true
        }
        return false
    }
        
    var body: some View {
        ZStack {
            VStack(spacing:0) {
                
                //Header
                VStack(spacing: 0) {
                    Text("Your Favorite Jokes")
                        .modifier(Title())
                    Rectangle()
                        .fill(Color.secondary.opacity(0.2))
                        .frame(height: 4)
                }
                      
                if isFavoriteEmpty {
                    Spacer()
                    EmptyView()
                    Spacer()
                } else {
                    //List of jokes
                    ListOfJokes(show: $show, jokeToShow: $jokeToShow)
                }
            }
            .blur(radius: show ? 3 : 0)
            
            if show {
                PopUpJoke(show: $show, jokeToShow: jokeToShow)
                    .padding()
                    .background(.ultraThinMaterial, in:RoundedRectangle(cornerRadius: 20))
                    .padding()
                    .transition(.slide)
                    .zIndex(1)
                    .onTapGesture( perform: {
                        self.show = false
                    })
                    .offset(popUpLocation)
                    .gesture(DragGesture(minimumDistance: 100)
                        .updating($popUpLocation, body: { value, popUpLocation, transaction in
                            if show {
                                popUpLocation = value.translation
                            }
                        })
                            .onEnded({ value in
                                show = false
                            }))
                    .animation(.default, value: popUpLocation)
            }
        }
        .animation(.default, value:show)
    }
}

struct FavoriteJokesView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .environmentObject(ContentModel())
        FavoriteJokesView()
            .environmentObject(ContentModel())
    }
}


