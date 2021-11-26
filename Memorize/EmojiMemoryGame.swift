//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by testinium on 8.11.2021.
//

import Foundation





class EmojiMemoryGame :ObservableObject{
    typealias Card = MemoryGame<String>.Card
    
    //1. Manytimes, MV generates the Model
    //   Sometimes if reaching to DB or network it is not necessary
    //   but generally, MV initilizes the Model.
    //   Also, if the MV goes away, Model will go away and game finishes
    //   MV owns the Model such a variable.

    //2. Classes Variables should have initizers or assigned value (before generated)
    //   Here we will be using Model initilizer with given 2 parameters to use
   @Published private var model  =  MemoryGame<String>(numberOfPairsOfCards:10) { emojis[$0]   }
    
    private static var emojis  = ["🚗","🚒","🚖","🛵","✈️","🛴","⛴","🚀","🚜","🚛","🛻","🚑","🚓","🏎","🛰","💺","🛩","🚢","🚧","⛽️","🪝","⚓️","🛺","🚨"]

    
    
    //3. This function returns the COPY of the actual cards
    //   You can use the private(set) instead as well.
    //
    var cards : [Card] {
        return model.cards
    }
        
    // MARK: - Intent
    public func choose(_ card:Card){
        model.choose(card)
    }
    
} //emojiMemoryGame
