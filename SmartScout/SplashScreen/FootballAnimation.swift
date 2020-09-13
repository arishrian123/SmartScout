//
//  FootballAnimation.swift
//  SmartScout
//
//  Created by Oliver Cordingley on 12/09/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI
import SDWebImage

struct FootballAnimation: View {
    
    @Binding var isAnimating: Bool
    @State var isOpacity = false
    var body: some View {
        
        VStack {
            
     Circle()
        .frame(width: 100, height: 100)
            
    }
}
}
    struct FootballAnimation_Previews: PreviewProvider {
        static var previews: some View {
            FootballAnimation(isAnimating: .constant(false))
        }
}
