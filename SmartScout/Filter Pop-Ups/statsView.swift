//
//  statsView.swift
//  SmartScout
//
//  Created by Oliver Cordingley on 07/10/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

struct statsView: View {
    
    @State var show = false
    var body: some View {
        
        ZStack{
            
            //mainview
            
            //fab view
            
            VStack{
                
                Spacer()
                
                HStack{
                    
                    Spacer()
                    
                    stattrack(show: $show)
                    
                }.padding(.bottom, 12)
                    .padding(.trailing, 166)
            }
            
        }
        
        
        
    }
}
struct statsView_Previews: PreviewProvider {
    static var previews: some View {
        statsView()
    }
}

struct stattrack : View {
    
    @Binding var show : Bool
    @State var gradient = [Color("1red"), Color("1orange")]
    @State var startPoint = UnitPoint(x: 1.75, y: 0)
    @State var endPoint = UnitPoint(x: -2, y: 0)
    
    var body : some View{
        
        VStack(spacing : 20){
            
            if self.show {
                
                Button(action: {
                    
                    self.show.toggle()
                    
                }) {
                    
                    Text("statistics")
                }
            }
            
            Button(action: {
                
                self.show.toggle()
                
            }) {
                
                ZStack{
                    
                    
                    Capsule()
                        .fill(LinearGradient(gradient: Gradient(colors: self.gradient), startPoint: self.startPoint, endPoint: self.endPoint))
                        .frame(width: 236, height: 55)
                    
                    HStack(alignment: .center, spacing: 10, content:{
                        
                        
                        HStack {
                            
                            Image(systemName: "eye.fill")
                                .foregroundColor(Color("11grey"))
                                .opacity(0.5)
                            
                            Text("111")
                                .font(Font.custom("Poppins-Medium", size: 25))
                                .foregroundColor(Color("11grey"))
                           
                        }
                      .padding(5)
                        
                        HStack {
                            Image(systemName: "suit.heart.fill")
                                .foregroundColor(Color("11grey"))
                                .opacity(0.5)
                            
                            Text("30")
                                .font(Font.custom("Poppins-Medium", size: 25))
                                .foregroundColor(Color("11grey"))
                        }
                       
                        .padding(5)
                        HStack {
                            Image(systemName: "envelope.fill")
                                .foregroundColor(Color("11grey"))
                                .opacity(0.5)
                            
                            Text("4")
                                .font(Font.custom("Poppins-Medium", size: 25))
                                .foregroundColor(Color("11grey"))
                            
                        }
                        .padding(5)
                    })
                    
                    
                }
                
                
            }
            
            
            
            
        }
    }
    
}

