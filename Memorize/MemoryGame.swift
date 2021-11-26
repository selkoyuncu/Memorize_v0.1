//
//  MemoryGame.swift
//  Memorize
//
//  Created by testinium on 8.11.2021.
//

import Foundation
import SwiftUI


struct MemoryGame<T> where T:Equatable {
    
    // read-only for other classes
    // only choose can change card data
    private(set) var cards : [Card]
    
    private var idxOfOneAndOnlyCardisFacedUp : Int?
    
    init(numberOfPairsOfCards:Int, cardContentFoo:(Int)->T){
        
        // generate an empty array
        cards = [Card]()
        
        // generate contents
        for pairIndex in 0..<numberOfPairsOfCards{
            cards.append( Card(content: cardContentFoo(pairIndex),id: pairIndex*2))
            cards.append( Card(content: cardContentFoo(pairIndex),id: pairIndex*2+1))
        }
    }//init
    
    
    // func
    mutating func choose(_ card: Card){
        
        //1- find the chosen index(location) from the cards array
        //2- if this card is already chosen exit from choose function.
        //3- check if there is an already active card waiting for match
        //4- compare the active card content with chosen card content and mark if matched.
        
        if let chosenIdx = cards.firstIndex(where: {aCard in aCard.id == card.id }),
           !cards[chosenIdx].isMatched,
           !cards[chosenIdx].isFaceUp
        {
            if  let idxOfPotantialMatch = idxOfOneAndOnlyCardisFacedUp
            {
                if cards[idxOfPotantialMatch].content == cards[chosenIdx].content {
                    cards[idxOfPotantialMatch].isMatched = true
                    cards[chosenIdx].isMatched = true
                }
                idxOfOneAndOnlyCardisFacedUp = nil
               
            }else{
                for idx in 0..<cards.count{
                    cards[idx].isFaceUp = false
                }
                idxOfOneAndOnlyCardisFacedUp = chosenIdx
            }
            cards[chosenIdx].isFaceUp.toggle()
        }
        
    }//choose

    

    
    struct Card : Identifiable{
        var isFaceUp:Bool = false
        var isMatched:Bool = false
        var content:T
        var id: Int
        
    }// struct Card
    
}// struct MemoryGame
