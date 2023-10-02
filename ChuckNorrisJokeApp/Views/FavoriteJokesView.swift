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
                        .multilineTextAlignment(.center)
                        .font(.title.weight(.semibold))
                        .fontDesign(.monospaced)
                        .foregroundColor(.primary)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 85)
                        .background(.ultraThickMaterial)
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
                    .background(RoundedRectangle(cornerRadius: 20).fill(.ultraThinMaterial))
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

struct EmptyView: View {
    var body: some View {
        VStack {
            Text("You have no Jokes, add some!")
                .foregroundColor(.primary)
                .padding()
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}
