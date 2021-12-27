//
//  ContentView.swift
//  Memorize
//
//  Created by testinium on 30.10.2021.
//

import SwiftUI


struct EmojiMemoryGameView: View {
    
    @ObservedObject var game:EmojiMemoryGame
    
    //=======================================//
    var body: some View {
        
        AspectVGrid(items:game.cards,aspectRatio:2/3) { card in
            cardView(for: card)
        }
            .foregroundColor(.red)
            .padding(.horizontal)
        
    } // var body
    
    //=======================================//
    @ViewBuilder
    private func cardView(for card:EmojiMemoryGame.Card)-> some View
    {
    
        if card.isMatched && !card.isFaceUp
        {
            Rectangle().opacity(0)
        }
        else
        {
            CardView(card)
                .padding(4)
                .onTapGesture { game.choose(card) }
        }
    
    }//cardView()
    
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
                Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90) )
                    .padding(5)
                    .opacity(0.5)
                Text(card.content)
                    
                    .rotationEffect(Angle(degrees: card.isMatched ? 360 : 0))
                    .animation(.linear(duration: 2).repeatForever(autoreverses: false))
                    .font(Font.system(size: DrawingConstants.fontSize))
                   // .font(font(in: geometry.size))
                    .scaleEffect(scale(thatFits:geometry.size))
                
            }
                //.modifier(Cardify(isFaceUp: card.isFaceUp))
                .cardify(isFaceUp: card.isFaceUp)
            
        }// geometry reader
        
    }
    private func scale (thatFits size: CGSize)->CGFloat{
        min(size.width,size.height) / (DrawingConstants.fontSize / DrawingConstants.fontScale)
    }
    
    private func font ( in size:CGSize ) -> Font{
        return Font.system(size:  min(size.height, size.width) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
     
        static let cornerRadious: CGFloat = 10
        static let lineWidth : CGFloat = 3
        static let fontScale : CGFloat = 0.7
        static let fontSize : CGFloat = 32
    }
        
        
    
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
     //   ContentView().preferredColorScheme(.dark)
        let game = EmojiMemoryGame()
        game.choose( game.cards.first!)
        return EmojiMemoryGameView(game:game).preferredColorScheme(.dark)
    }
}
