//
//  MemorizeApp.swift
//  Memorize
//
//  Created by testinium on 30.10.2021.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            
            EmojiMemoryGameView(game: game)
        }
    }
}
