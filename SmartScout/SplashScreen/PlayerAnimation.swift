//
//  PlayerAnimation.swift
//  SmartScout
//
//  Created by Oliver Cordingley on 15/09/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct PlayerAnimation:  View {
    
    @State var isOpacity = false
    
    var body: some View {
        
        
        ZStack{
            
            AnimatedImage(name: "Unknown.gif")
            .customLoopCount(1)
            .resizable()
                .frame(width: 120, height: 120)
                .opacity(isOpacity ? 0 : 1)
            
            
                .onAppear{
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) { withAnimation {
                        self.isOpacity = true
                        
                        }
            }
        }
    }
}
}

struct PlayerAnimation_Previews: PreviewProvider {
    static var previews: some View {
        
        PlayerAnimation()
}
}
