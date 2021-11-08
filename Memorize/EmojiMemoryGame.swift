//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by testinium on 8.11.2021.
//

import Foundation





class EmojiMemoryGame {
    
    //1. Manytimes, MV generates the Model
    //   Sometimes if reaching to DB or network it is not necessary
    //   but generally, MV initilizes the Model.
    //   Also, if the MV goes away, Model will go away and game finishes
    //   MV owns the Model such a variable.
    
    
    
    //2. Classes Variables should have initizers or assigned value (before generated)
    //   Here we will be using Model initilizer with given 2 parameters to use
    private var model : MemoryGame <String> =  MemoryGame<String>(numberOfPairsOfCards:4) {index in
         emojis[index]
    }
    
    static var emojis  = ["🚗","🚒","🚖","🛵","✈️","🛴","⛴","🚀","🚜","🚛","🛻","🚑","🚓","🏎","🛰","💺","🛩","🚢","🚧","⛽️","🪝","⚓️","🛺","🚨"]

    
    
    //3. This function returns the COPY of the actual cards
    //   You can use the private(set) instead as well.
    //
    var cards : [MemoryGame<String>.Card] {
        return model.cards
    }
    
    
} //emojiMemoryGame
