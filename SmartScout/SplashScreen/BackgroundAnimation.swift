//
//  BackgroundAnimation.swift
//  SmartScout
//
//  Created by Oliver Cordingley on 12/09/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

struct BackgroundAnimation: View {
    
    @State var gradient = [Color("color2"), Color("color1")]
    @State var startPoint = UnitPoint(x: 1.5, y: 0)
    @State var endPoint = UnitPoint(x: 0, y: 0)
    @State var showGradient = false
    @State var isPresent = false
    @State var isFuture = false
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        
        ZStack{
            
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: self.gradient), startPoint: self.startPoint, endPoint: self.endPoint))
                .frame(width: 35, height: 35)
                .scaleEffect(isPresent ? (width/12) : 1)
                .animation(.easeOut(duration: 0.4))
                
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.1){
                self.isPresent.toggle()
                withAnimation(.easeInOut(duration:  1.5)){
                self.startPoint = UnitPoint(x: 1, y: 0)
                    self.endPoint = UnitPoint(x: 0, y: 0.5)
            }
        }
    }
}
}

struct BackgroundAnimation_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundAnimation()
    }
}
