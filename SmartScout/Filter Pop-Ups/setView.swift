//
//  setView.swift
//  SmartScout
//
//  Created by Oliver Cordingley on 07/10/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

struct setView: View {
    
    @State var show = false
    var body: some View {
        
                
                HStack{
                    
                    gearButton(show: $show)
                    
                }.offset(x: 160, y: -380)
            .edgesIgnoringSafeArea(.all)
        .background(Color("11grey").opacity(0).edgesIgnoringSafeArea(.all))
    
}
}
struct setView_Previews: PreviewProvider {
    static var previews: some View {
        setView()
    }
}

struct gearButton : View {
    
    @Binding var show : Bool
    
    var body : some View{
        
        VStack(spacing : 20){
            
            if self.show {
            
                Button(action: {
                    
                    self.show.toggle()
                    
                }) {
                    
                    Text("Settings")
                }
            }
            
            Button(action: {
                
                self.show.toggle()
                
            }) {
                
                Image(systemName: "gear")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(15)
            }
            .background(Color("11grey"))
            .foregroundColor(Color("13grey"))
            .clipShape(Circle())

        }.animation(.spring())
            
        
    }
}
