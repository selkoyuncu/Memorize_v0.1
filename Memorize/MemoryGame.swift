//
//  MemoryGame.swift
//  Memorize
//
//  Created by testinium on 8.11.2021.
//

import Foundation


struct MemoryGame<T> {
    
    var cards : Array <Card<T>>
    
    func choose(_ choosen: Card<T>){
        
    }
    
    struct Card<T> {
        
        var isFaceUp:Bool = false
        var isMatched:Bool = false
        var content:T
        
    }
    
}// struct memorygame
