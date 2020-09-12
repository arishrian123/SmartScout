//
//  GradientAnimation.swift
//  SmartScout
//
//  Created by Oliver Cordingley on 12/09/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

struct GradientAnimation: View {
    
    @State var gradient = [Color("color1"), Color("color2")]
    @State var startPoint = UnitPoint(x: 0, y: 0)
    @State var endPoint = UnitPoint(x: 10, y: 10)
    @State var showGradient = false
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
        
        var body: some View {
            
            VStack{
                
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: self.gradient),startPoint: self.startPoint, endPoint: self.endPoint))
                    .frame(width: width, height: height)
                    .onAppear {
                        withAnimation(.easeOut(duration: 2 )){
                            self.startPoint = UnitPoint(x:0, y: 0)
                            self.endPoint = UnitPoint (x:1, y: 1)
                        }
                }
            }
    }
}
        

struct GradientAnimation_Previews: PreviewProvider {
    static var previews: some View {
        GradientAnimation()
    }
}
