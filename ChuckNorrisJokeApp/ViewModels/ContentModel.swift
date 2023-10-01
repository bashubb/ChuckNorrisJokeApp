//
//  ContentModel.swift
//  ChuckNorrisJokeApp
//
//  Created by HubertMac on 21/06/2023.
//

import Foundation

class ContentModel: ObservableObject {
    
    
    @Published var favoriteJokes: [String] = []
    @Published var jokeValue: String?
    
    init() {
    
    }

    /// Api call and pharsing
    func getRemoteData() async {
        
        // Check if the url is not nil
        if let url = URL(string: "https://api.chucknorris.io/jokes/random") {
            
            // URL Session
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                
                //Create a JSON decoder
                let decoder = JSONDecoder()
                
                // Pharse the data
                do {
                    let jokeData = try decoder.decode(Joke.self, from: data)
                    if let value = jokeData.value {
                        self.jokeValue = value
                    }
                    
                    
                } catch {
                    // Problem with pharsing
                    print(error.localizedDescription)
                }
            } catch {
                // Problem with data
                print(error.localizedDescription)
            }
            
        }
        
    }
}


