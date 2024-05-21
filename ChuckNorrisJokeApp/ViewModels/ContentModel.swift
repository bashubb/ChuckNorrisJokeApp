//
//  ContentModel.swift
//  ChuckNorrisJokeApp
//
//  Created by HubertMac on 21/06/2023.
//

import Foundation

class ContentModel: ObservableObject {
    @Published var choosenCategory = "random"
    @Published var categories: [String] = ["random"]
    @Published var jokeValue = ""
    @Published var favoriteJokes: [String] = [] {
        didSet {
            if let encoded = try? JSONEncoder().encode(favoriteJokes) {
                UserDefaults.standard.set(encoded, forKey: "favoriteJokes")
            }
        }
    }
    
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
        loadFavoriteJokes()
    }
    
    func getRemoteData() async {
        if let url = URL(string: urlString) {
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                
                let decoder = JSONDecoder()
                
                do {
                    let jokeData = try decoder.decode(Joke.self, from: data)
                    if let value = jokeData.value {
                        await MainActor.run {
                            self.jokeValue = value
                        }
                    }
                } catch {
                    await MainActor.run {
                        self.jokeValue = "There is no joke, sorry!"
                    }
                    print(error.localizedDescription)
                }
            } catch {
                await MainActor.run {
                    self.jokeValue = "Sorry, it seems like you don't have an internet connection!"
                }
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
                    
                }
            } catch {
                print(error.localizedDescription)
            }
        }
            
    }
    
    func loadFavoriteJokes() {
        if let savedItems = UserDefaults.standard.data(forKey: "favoriteJokes") {
            if let decodedItems = try? JSONDecoder().decode([String].self, from: savedItems) {
                favoriteJokes = decodedItems
                return
            }
        }
        favoriteJokes = []
    }
    
}


