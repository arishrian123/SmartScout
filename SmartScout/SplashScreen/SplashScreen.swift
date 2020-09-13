//
//  SplashScreen.swift
//  SmartScout
//
//  Created by Ollie Cordingley on 05/09/2020.
//  Copyright © 2020 Ollie Cordingley. All rights reserved.
//


import SwiftUI

struct SplashScreen: View {
    
    @State var isVisible = false
    @State var isSuccess = false
    @State var isComplete = false
    @State var isAnim1 = false
    @State var isLogo = false
    @State var isRepeat: Bool = true
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        
        ZStack {
            
            Text("Smart")
                .foregroundColor(Color.white)
                .font(Font.custom("Poppins-Light", size: 55))
                .offset(x: -105)
                .offset(x: isVisible ? 27 : -250)
                .animation(.spring())
                .zIndex(1)
            
            Text("Scout")
                .foregroundColor(Color.white)
                .font(Font.custom("Poppins-Medium", size: 55))
                .offset(x: 52)
                .offset(x: isVisible ? 27: 250)
                .animation(.spring())
                .zIndex(1)
            
            Image("curzen_logo_white")
                .resizable()
                .frame(width: 110, height: 45)
                .offset(y: 300)
                .offset(y: isLogo ? 0: 80)
                .opacity(0.3)
                .animation(.spring())
                .zIndex(1)
            
            
            BackgroundAnimation()
                .offset(x: -1.5, y: 5)
                .opacity(isSuccess ? 1 : 0)
                
                .onAppear{
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                        withAnimation {
                            self.isVisible = true
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                        withAnimation {
                            self.isLogo = true
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
                        withAnimation {
                            self.isRepeat = true
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation {
                            self.isSuccess = true
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.44) {
                        withAnimation {
                            self.isComplete = true
                        }
                    }
            }
            
        }
    }
}
struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
