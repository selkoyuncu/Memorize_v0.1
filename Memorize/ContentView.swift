//
//  ContentView.swift
//  Memorize
//
//  Created by testinium on 30.10.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        HStack(){
            CardView(isFaceUp: true)
            CardView(isFaceUp: false)
        }
        .padding(.horizontal)
        .foregroundColor(.red)
            
    }
}






struct CardView :  View {
    var isFaceUp: Bool
    
    var body: some View {
        
        ZStack(){
            if isFaceUp{
                RoundedRectangle(cornerRadius:  20).stroke(lineWidth: 3)
                RoundedRectangle(cornerRadius: 20).foregroundColor(.white)
                Text("😎").font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                
            } else {
                RoundedRectangle(cornerRadius: 20)
            }
        }
    }
}








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
        ContentView().preferredColorScheme(.light)
    }
}
