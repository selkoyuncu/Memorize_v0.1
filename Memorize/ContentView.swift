//
//  ContentView.swift
//  Memorize
//
//  Created by testinium on 30.10.2021.
//

import SwiftUI


struct ContentView: View {
    
    var viewModel:EmojiMemoryGame
    
    var body: some View {
        
        ScrollView{
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach ( viewModel.cards ) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture{
                            viewModel.choose(card)
                        }
                   
                }//forEach
            }//Lazy
            
            .foregroundColor(.red)
        }//scroll
        .padding(.horizontal)
        
    } // var body
    
    
    
    //=======================================//

    
    
} //Struct ContentView:some View






struct CardView :  View {

    var card : MemoryGame<String>.Card
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius:  20)
        ZStack(){
            if card.isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                
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
        ContentView(viewModel:game).preferredColorScheme(.light)
    }
}
