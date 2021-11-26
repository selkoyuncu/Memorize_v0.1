//
//  ContentView.swift
//  Memorize
//
//  Created by testinium on 30.10.2021.
//

import SwiftUI


struct EmojiMemoryGameView: View {
    
    @ObservedObject var game:EmojiMemoryGame
    
    var body: some View {
        
        ScrollView{
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach ( game.cards ) { card in
                    CardView(card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture{
                            game.choose(card)
                        }
                   
                }//forEach
            }//LazyVGrid
            
            .foregroundColor(.red)
        }//scroll
        .padding(.horizontal)
        
    } // var body
    
    
    
    //=======================================//

    
    
} //Struct ContentView:some View






struct CardView :  View {

    //typedef used
    let card : EmojiMemoryGame.Card
    
    //init given parameter free init option to us
    init (_ card: EmojiMemoryGame.Card){
        self.card = card
    }
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius:  20)
        ZStack(){
            if card.isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                
            } else if card.isMatched{
                shape.opacity(0)
            } else {
                shape.fill()
            }

            
        }//Zstack
        .foregroundColor(.red)
        
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
     //   ContentView().preferredColorScheme(.dark)
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game:game).preferredColorScheme(.dark)
    }
}
