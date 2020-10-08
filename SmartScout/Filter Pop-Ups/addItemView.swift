//
//  addItemView.swift
//  SmartScout
//
//  Created by Oliver Cordingley on 07/10/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//


import SwiftUI

struct addItemView: View {
    
    @State var show = false
    var body: some View {
        
        ZStack{
            
            //mainview
            
            //fab view
            
            VStack{
                
                Spacer()
                
                HStack{
                    
                    Spacer()
                    
                    addItem(show: $show)
                    
                }.padding(.bottom, 12)
                    .padding(.trailing, 98.5)
            }
            
        }
        
        
        
    }
}
struct addItemView_Previews: PreviewProvider {
    static var previews: some View {
        addItemView()
    }
}

struct addItem : View {
    
    @Binding var show : Bool
    
    var body : some View{
        
        VStack(spacing : 20){
            
            if self.show {
            
                Button(action: {
                    
                    self.show.toggle()
                    
                }) {
                    
                    Text("Item")
                }
            }
            
            Button(action: {
                
                self.show.toggle()
                
            }) {
                
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(18)
            }
            .background(Color("11grey"))
            .foregroundColor(Color("13grey"))
            .rotationEffect(.degrees (show ? 90 : 0))
            .clipShape(Circle())

        }.animation(.spring())
            
        
    }
}
