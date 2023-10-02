//
//  ContentModel.swift
//  ChuckNorrisJokeApp
//
//  Created by HubertMac on 21/06/2023.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var choosenCategory = "random"
    @Published var categories: [String] = ["random","animal",
                                           "career",
                                           "celebrity",
                                           "dev",
                                           "explicit",
                                           "fashion",
                                           "food",
                                           "history",
                                           "money",
                                           "movie",
                                           "music",
                                           "political",
                                           "religion",
                                           "science",
                                           "sport",
                                           "travel"]
    @Published var favoriteJokes: [String] = []
    @Published var jokeValue = ""
    
    
    var urlString: String {
        if choosenCategory == "random"{
            return "https://api.chucknorris.io/jokes/random"
        } else {
            return "https://api.chucknorris.io/jokes/random?category=\(choosenCategory)"
        }
    }
    
    init() {
        Task {
            await getCategories()
        }
    }

    /// Api call and pharsing
    func getRemoteData() async {
        
        // Check if the url is not nil
        if let url = URL(string: urlString) {
            
            // URL Session
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                
                //Create a JSON decoder
                let decoder = JSONDecoder()
                
                // Pharse the data
                do {
                    let jokeData = try decoder.decode(Joke.self, from: data)
                    if let value = jokeData.value {
                        await MainActor.run {
                            self.jokeValue = value
                        }
                    }
                } catch {
                    // Problem with pharsing
                    await MainActor.run {
                        self.jokeValue = "There is no joke, sorry!"
                    }
                    print(error.localizedDescription)
                }
            } catch {
                await MainActor.run {
                    self.jokeValue = "Sorry, it seems like you don't have an internet connection!"
                }
                // Problem with data
                print(error.localizedDescription)
            }
        }
    }
    
    
    func getCategories() async {
        
        if let url = URL(string:"https://api.chucknorris.io/jokes/categories") {
            
            do {
                let(data, _) = try await URLSession.shared.data(from: url)
                
                let decoder = JSONDecoder()
                
                let categoriesData = try decoder.decode([String].self, from: data)
                
                await MainActor.run {
                    self.categories += categoriesData
                    print(categories)
                }
                
            } catch {
                // problem with api cal
                print(error.localizedDescription)
            }
        }
            
    }
    
}


