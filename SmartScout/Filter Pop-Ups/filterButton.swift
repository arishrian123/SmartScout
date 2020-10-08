//
//  filterButton.swift
//  SmartScout
//
//  Created by Oliver Cordingley on 04/10/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

struct filterButton: View {
    
    @State var show = false
    var body: some View {
        
        ZStack{
            
            //mainview
            
            //fab view
            
            VStack{
                
                Spacer()
                
                HStack{
                    
                    Spacer()
                    
                    ExpandableFAB(show: $show)
                    
                }.padding(.bottom, 12)
                    .padding(.trailing, 10)
            }
            
        }
        
        
        
    }
}
struct filterButton_Previews: PreviewProvider {
    static var previews: some View {
        filterButton()
    }
}

struct ExpandableFAB : View {
    
    @Binding var show : Bool
    @State var gradient = [Color("1red"), Color("1orange")]
    @State var startPoint = UnitPoint(x: 1.75, y: 0)
    @State var endPoint = UnitPoint(x: -2, y: 0)
    
    var body : some View{
        
        VStack(spacing : 10){
            
            if self.show {
                
                VStack{
                    
                    Button(action: {
                        
                        self.show.toggle()
                        
                    }) {

                        Image(systemName: "gear")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(20)
                        .foregroundColor(Color("13grey"))
                    }
                        
                        
                    .background(Color("11grey"))
                    
                    .clipShape(Circle())
                    
                    
                    Text("Settings")
                         .foregroundColor(Color(("11grey")))
                    
                }
                VStack{
                    
                    Button(action: {
                        
                        self.show.toggle()
                        
                    }) {

                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(20)
                    .foregroundColor(Color("13grey"))
                    }
   
                    .background(Color("11grey"))
                    .clipShape(Circle())
                    
                    
                    Text("Age")
                         .foregroundColor(Color(("11grey")))
                    
                }
                VStack{
                    
                    
                    Button(action: {
                        
                        self.show.toggle()
                        
                    }) {
                        
                        
                        
                        Image(systemName: "safari")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(20)
                        .foregroundColor(Color("13grey"))
                    }
                        
                        
                    .background(Color("11grey"))
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    
                    Text("Location")
                .foregroundColor(Color(("11grey")))
                    
                }
                
                VStack{
                    
                    
                    Button(action: {
                        
                        self.show.toggle()
                        
                    }) {
                        
                        
                        
                        Image(systemName: "flame")
                            .resizable()
                            .frame(width: 20, height: 22)
                            .padding(20)
                        .foregroundColor(Color("13grey"))
                    }
                        
                        
                    .background(Color("11grey"))
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    
                    Text("Skill")
                        .foregroundColor(Color(("11grey")))
                }
                
            }
            Button(action: {
                
                self.show.toggle()
                
            }) {
                
                Image(systemName: "slider.horizontal.3")
                    .resizable()
                    .frame(width: 30, height: 25)
                    .padding(25)
            }
            .background(LinearGradient(gradient: Gradient(colors: self.gradient), startPoint: self.startPoint, endPoint: self.endPoint))
            .foregroundColor(Color("11grey"))
            .clipShape(Circle())
            
        }.animation(.spring())
        
        
        
    }
}

