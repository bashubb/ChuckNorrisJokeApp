//
//  ChuckNorrisJokeAppApp.swift
//  ChuckNorrisJokeApp
//
//  Created by HubertMac on 21/06/2023.
//

import SwiftUI

@main
struct ChuckNorrisJokeAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ContentModel())
        }
    }
}
