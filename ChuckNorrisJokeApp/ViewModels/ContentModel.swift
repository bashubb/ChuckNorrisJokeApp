//
//  ContentModel.swift
//  ChuckNorrisJokeApp
//
//  Created by HubertMac on 21/06/2023.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var joke = Joke()
    
    init() {
        
        getRemoteData()
    }
    
    
    func getRemoteData() {
        
        let url = URL(string: "https://api.chucknorris.io/jokes/random")
        
        if let url = url {
            
            //Create URL request
            let request = URLRequest(url: url)
            
            
            //Create a session
            let session = URLSession.shared
            
            //Create data task
            let dataTask = session.dataTask(with: request) { data, response, error in
                
                //Check if there is no error
                if error == nil {
                    
                    do {
                        
                        //Create a json decoder
                        let decoder = JSONDecoder()
                        
                        // parse the data
                        let dataJoke = try decoder.decode(Joke.self, from: data!)
                        
                        DispatchQueue.main.async {
                            self.joke = dataJoke
                        }
                        
                        
                    }
                    catch {
                        // Problem with data
                        print(error.localizedDescription)
                    }
                }
            }
            dataTask.resume()
            
        }
    }
    
}
