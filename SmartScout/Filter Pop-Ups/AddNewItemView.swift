//
//  AddNewItemView.swift
//  SmartScout
//
//  Created by Oliver Cordingley on 03/10/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

struct AddNewItemView: View {
    
    @State var onOff = false
    
    var body: some View {
        
        ZStack{
            
            Pop()
            
            ZStack{
                
                Circle()
                    .frame(width: 55, height: 55)
                    .offset(x: 70, y: 400)
                
                Button(action: {
                    
                    withAnimation(.spring()){
                        
                        self.onOff.toggle()
                    }
                    
                }) {
                    
                    Image(systemName: self.onOff ? "power" : "power")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .rotationEffect(.degrees( onOff ? 360 : 180))
                        .frame(width: 20, height: 22)
                        .foregroundColor( onOff ? (Color.green) : (Color("13grey")))
                        .padding()
                    
                }.offset(x: 70, y: 400)
                
            }
            Circle()
                .frame(width: 55, height: 55)
                .offset(x: -5, y: 400)
            
            Circle()
                .frame(width: 55, height: 55)
                .offset(x: -85, y: 400)
            
            Circle()
                .frame(width: 55, height: 55)
                .offset(x: -165, y: 400)
            
            
        }
    }
}

struct AddNewItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewItemView()
    }
}
