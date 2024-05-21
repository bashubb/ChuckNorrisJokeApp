//
//  EmptyViewq.swift
//  ChuckNorrisJokeApp
//
//  Created by HubertMac on 21/05/2024.
//
import SwiftUI

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
