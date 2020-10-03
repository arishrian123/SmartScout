//
//  Popup1View.swift
//  SmartScout
//
//  Created by Oliver Cordingley on 02/10/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

struct Popup1View: View {
    var body: some View {
        
        
        Pop()
    }
}

struct Popup1View_Previews: PreviewProvider {
    static var previews: some View {
        Popup1View()
    }
}

struct Pop : View {
    
    @State var show = false
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing, content: {
            
            VStack {
                
                HStack{

                    Spacer()
                    
                }
                
                Spacer()
            }
            
            VStack(alignment: .center, spacing: 15) {
                
                if self.show{
                
                PopOver()
                    .background(Color.white)
                    .cornerRadius(15)
                    .offset(y: -450)
                    
                }
                
                Button(action: {
                    
                    withAnimation(.spring()){
                        
                        self.show.toggle()
                    }
                    
                }) {
                    
                    Image(systemName: self.show ? "arrow.up" : "arrow.up")
                        .resizable()
                        .rotationEffect(.degrees( show ? 90 : 180))
                        .frame(width: 20, height: 22)
                        .foregroundColor(.orange)
                        .padding()
        
                }.background(Color.white)
                    .clipShape(Circle())
                .offset(y: -750)
                
            }
            .padding()

        }).edgesIgnoringSafeArea(.all)
            .background(Color.black.opacity(1).edgesIgnoringSafeArea(.all))
    }
}


struct PopOver : View {
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 18) {
            
            Button(action: {
                
            }) {
                
                HStack(spacing : 15){
                    
                    Image(systemName: "Home")
                    Text("Age")
                }
            }
            
            Divider()
            Button(action: {
                
            }) {
                
                HStack(spacing : 15){
                    
                    Image(systemName: "home")
                    Text("Location")
                }
            }
            Divider()
            Button(action: {
                
            }) {
                
                HStack(spacing : 15){
                    
                    Image(systemName: "home")
                    Text("Skill Type")
                }
            }
            Divider()
            Button(action: {
                
            }) {
                
                HStack(spacing : 15){
                    
                    Image(systemName: "home")
                    Text("Club")
                }
            }
        }
        .foregroundColor(.black)
        .frame(width: 130)
        .padding()
    }
}

