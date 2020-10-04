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
    @State var gradient = [Color("1red"), Color("1orange")]
    @State var startPoint = UnitPoint(x: 0, y: 1.75)
    @State var endPoint = UnitPoint(x: 0, y: -1)
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing, content: {
            
            VStack {
                
                HStack{
                    
                    
                    Capsule()
                        .fill(LinearGradient(gradient: Gradient(colors: self.gradient), startPoint: self.startPoint, endPoint: self.endPoint))
                         .rotationEffect(.degrees(-90))
                    .frame(width: 120, height: 55)
                        .offset(x: 305, y: 790)

                    Spacer()
                    
                }
                
                Spacer()
            }
            
            HStack(alignment: .center, spacing: 30) {
                
                if self.show{
                
                PopOver()
                    .background(Color.white)
                    .cornerRadius(25)
                    .offset(x: 80, y: -130)
                    
                }
                
                Button(action: {
                    
                    withAnimation(.spring()){
                        
                        self.show.toggle()
                    }
                    
                }) {
                    
                    Image(systemName: self.show ? "chevron.right.circle.fill" : "chevron.right.circle")
                        .resizable()
                        .frame(width: 45, height: 45)
                        .rotationEffect(.degrees( show ? -180 : -90))
                        .frame(width: 20, height: 22)
                        .foregroundColor( show ? (Color.white) : (Color("11grey")))
                        .padding()

                }
                .offset(x: -7, y: -7)
                
            }
            .padding()

        }).edgesIgnoringSafeArea(.all)
            .background(Color("11grey").opacity(1).edgesIgnoringSafeArea(.all))
    }
}


struct PopOver : View {
    
    @State var ageShow = false
    @State var locationShow = false
    @State var skillTypeShow = false
    @State var clubShow = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            
            
            Button(action: {
                
            }) {
                
                HStack(spacing : 10){
                    
                    Image(systemName: "person.fill")
                    Text("Age")
                }
            }
            
            Divider()
            Button(action: {
                
            }) {
                
                HStack(spacing : 10){
                    
                    Image(systemName: "safari.fill")
                    Text("Location")
                }
            }
            Divider()
            Button(action: {
                
            }) {
                
                HStack(spacing : 10){
                    
                    Image(systemName: "flame.fill")
                    Text("Skill Type")
                }
            }
            Divider()
            Button(action: {
                
            }) {
                
                HStack(spacing : 10){
                    
                    Image(systemName: "circle.grid.hex.fill")
                    Text("Club")
                }
            }
        
        }
            .foregroundColor(.black)
            .frame(width: 110, height: 145)
            .padding()
    }
}

