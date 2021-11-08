//
//  ContentView.swift
//  Memorize
//
//  Created by testinium on 30.10.2021.
//

import SwiftUI


struct ContentView: View {
    
    var emojis  = ["🚗","🚒","🚖","🛵","✈️","🛴","⛴","🚀","🚜","🚛","🛻","🚑","🚓","🏎","🛰","💺","🛩","🚢","🚧","⛽️","🪝","⚓️","🛺","🚨"]
    
    @State var numberOfEmojis : Int = 20
    
    var body: some View {
        
        
        VStack {
            ScrollView{
               // title.padding().foregroundColor(.black)
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))]) {
                    ForEach (emojis[0..<numberOfEmojis], id: \.self) { emoji in
                        CardView(isFaceUp: true,content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }.padding(.horizontal)
            }//scroll
            
                Spacer()
                
                HStack{
                    remove
                    Spacer()
                    add
                }
                .padding(.horizontal)
                .font(.headline)
           
            
        }//Vstack
        
        .padding(.horizontal)
        .foregroundColor(.blue)
        
    } // var body
    
    
    
    //=======================================//
    var title : some View {
        Text ("Memorize !").font(.largeTitle)
    }
    
    var remove : some View {
        Button(action: {
            if numberOfEmojis > 1{
                numberOfEmojis -= 1
            }
        }, label: {
            VStack{
                Text("Remove")
                Image(systemName: "minus.circle")
            }
        })
    } // var remove
    
            
    var add :some View {
        Button(action: {
            if numberOfEmojis < emojis.count{
                numberOfEmojis += 1
            }
        }, label: {
            VStack{
                Text("Add")
                Image(systemName: "plus.circle")
            }
        })
    } // var add
    
} //Struct ContentView:some View






struct CardView :  View {
    @State var isFaceUp: Bool
    var content: String
  
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius:  20)
        ZStack(){
            if isFaceUp{
                shape.stroke(lineWidth: 3)
                shape.foregroundColor(.white)
                Text(content).font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                
            } else {
                shape.fill()
            }
        }//Zstack
        .onTapGesture(perform: {
            isFaceUp = !isFaceUp
        })
        
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
     //   ContentView().preferredColorScheme(.dark)
        ContentView().preferredColorScheme(.light)
    }
}
