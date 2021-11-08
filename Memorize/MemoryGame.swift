//
//  MemoryGame.swift
//  Memorize
//
//  Created by testinium on 8.11.2021.
//

import Foundation


struct MemoryGame<T> {
    
    // read-only for other classes
    // only choose can change card data
    private(set) var cards : [Card]
    
    
    init(numberOfPairsOfCards:Int, cardContentFoo:(Int)->T){
        
        // generate an empty array
        cards = [Card]()
        
        // generate contents
        for pairIndex in 0..<numberOfPairsOfCards{
            cards.append( Card(content: cardContentFoo(pairIndex)))
            cards.append( Card(content: cardContentFoo(pairIndex)))
        }
        
        
    }
    
    
    
    func choose(_ card: Card){
        
    }
    
    struct Card {
        var isFaceUp:Bool = false
        var isMatched:Bool = false
        var content:T
        
    }// struct Card
    
}// struct MemoryGame
