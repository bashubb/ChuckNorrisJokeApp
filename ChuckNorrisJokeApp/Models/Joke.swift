//
//  Joke.swift
//  ChuckNorrisJokeApp
//
//  Created by HubertMac on 21/06/2023.
//

import Foundation

struct Joke: Decodable, Identifiable {
    
    var categories: [String]?
    var created_at: String?
    var icon_url: String?
    var id: String?
    var updated_at: String?
    var url: String?
    var value: String?
}


