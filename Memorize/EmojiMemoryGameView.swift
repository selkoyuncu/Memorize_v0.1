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
        
        
        AspectVGrid(items:game.cards,aspectRatio:2/3) { card in
            cardView(for: card)
            
        }//AspectVGrid
        
        .foregroundColor(.red)
        .padding(.horizontal)
        
    } // var body
    
    
    
    //=======================================//
    @ViewBuilder
    private func cardView(for card:EmojiMemoryGame.Card)-> some View {
        if card.isMatched && !card.isFaceUp {
            Rectangle().opacity(0)
            
        }else{
            CardView(card)
                .padding(4)
                .onTapGesture{
                    game.choose(card)
                }
        }
    }
    
    
} //Struct ContentView:some View






struct CardView :  View {

    //typedef used
    let card : EmojiMemoryGame.Card
    
    //init given parameter free init option to us
    init (_ card: EmojiMemoryGame.Card){
        self.card = card
    }
    
    var body: some View {

        GeometryReader { geometry in
            
            
            ZStack(){
                let shape = RoundedRectangle(cornerRadius:  DrawingConstants.cornerRadious)
                if card.isFaceUp{
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 3)
                    Text(card.content).font(font(in: geometry.size))
                    
                } else if card.isMatched{
                    //shape.opacity(0) // make it invisible
                } else {
                    shape.fill()
                }
                
            }//Zstack
            .foregroundColor(.red)
            
        }// geometry reader
        
    }
    
    private func font ( in size:CGSize ) -> Font{
        return Font.system(size:  min(size.height, size.width) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
     
        static let cornerRadious: CGFloat = 10
        static let lineWidth : CGFloat = 3
        static let fontScale : CGFloat = 0.75
    }
        
        
    
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
     //   ContentView().preferredColorScheme(.dark)
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game:game).preferredColorScheme(.dark)
    }
}
