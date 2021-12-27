//
//  File.swift
//  Memorize
//
//  Created by testinium on 20.12.2021.
//

import SwiftUI


struct Cardify:ViewModifier  {

    var isFaceUp : Bool 
    
    func body (content: Content) -> some View{
        
        ZStack()
        {
            let shape = RoundedRectangle(cornerRadius:  DrawingConstants.cornerRadious)
        
            if isFaceUp
            {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                
            } else {
                shape.fill()
            }
            
            content
                .opacity(isFaceUp ? 1 : 0)
            
            
        }//Zstack
    }
    
    
    //=============================================
    private struct DrawingConstants {
     
        static let cornerRadious: CGFloat = 10
        static let lineWidth : CGFloat = 3
    
    }
}


extension View {
    
    func cardify(isFaceUp:Bool) -> some View {
        return self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
