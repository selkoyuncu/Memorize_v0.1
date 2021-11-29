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

        GeometryReader { geometry in
            
            let shape = RoundedRectangle(cornerRadius:  20)
            ZStack(){
                if card.isFaceUp{
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 3)
                    Text(card.content).font(font(in: geometry.size))
                    
                } else if card.isMatched{
                    shape.opacity(0)
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
     
        static let cornerRadious: CGFloat = 20
        static let lineWidth : CGFloat = 3
        static let fontScale : CGFloat = 0.8
    }
        
        
    
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
     //   ContentView().preferredColorScheme(.dark)
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game:game).preferredColorScheme(.dark)
    }
}
