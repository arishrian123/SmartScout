//
//  ScoutTabBar.swift
//  SmartScout
//
//  Created by Oliver Cordingley on 16/09/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

struct ScoutTabBar: View {
    
    @State var index = 0
    var body: some View {
        
        VStack{
            
            Spacer()
            
            CustomTabs(index: self.$index)
        }
        .background(Color.black.opacity(0.1).edgesIgnoringSafeArea((.top)))
    }
}

struct ScoutTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ScoutTabBar()
    }
}

struct CustomTabs : View {
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    @Binding var index : Int
    @State var showMenu = false
   
    var body : some View{
        
        HStack{
            
            Button(action: {
                
                self.index = 0
                
            }) {
                
                VStack{
                    
                    if self.index != 0{
                        
                        Image(systemName: "house")
                            .foregroundColor(Color.black.opacity(0.2))
                        
                    }
                    else{
                        
                        ZStack{
                            
                            Circle()
                                .foregroundColor(Color.white)
                                .frame(width: 62, height: 62)
                                .offset(y:-10)
                            
                            Image(systemName: "house")
                                .resizable()
                                .frame(width: width/19, height: height/45)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color("color1"))
                                .clipShape(Circle())
                                .offset(y: -20)
                                .padding(.bottom, -20)
                            
                        }
                        
                        
                        Text("Home").foregroundColor(Color.black.opacity(0.7))
                            .font(Font.custom("Poppins-Light", size: 10))
                            .offset(y: -12)
                        
                    }
                }
                
                
            }
            Spacer(minLength: 0)
            
            Button(action: {
                
                self.index = 1
                
            }) {
                
                VStack{
                    
                    if self.index != 1{
                        
                        Image(systemName: "magnifyingglass").foregroundColor(Color.black.opacity(0.2))
                    }
                    else{
                        ZStack{
                            Circle()
                                .foregroundColor(Color.white)
                                .frame(width: 62, height: 62)
                                .offset(y:-10)
                            
                            
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .frame(width: width/20, height: height/45)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color("color1"))
                                .clipShape(Circle())
                                .offset(y: -20)
                                .padding(.bottom, -20)
                            
                        }
                        
                        Text("Search").foregroundColor(Color.black.opacity(0.7))
                            .font(Font.custom("Poppins-Light", size: 10))
                            .offset(y: -12)
                    }
                }
                
                
            }
            Spacer(minLength: 0)
            
            ZStack {
                
                if self.showMenu {
                    PopUpMenu()
                        .offset(y: -50)
                }
                
                
                Circle()
                    .foregroundColor(Color.white)
                    .frame(width: 75, height: 75)
                
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .foregroundColor(Color("color1"))
                    
                    .onTapGesture {
                        
                        self.showMenu.toggle()
                        
                }
                
            }
            .offset(x: 0, y: -35)
            
            Spacer(minLength: 0)
            
            Button(action: {
                
                self.index = 2
                
            }) {
                
                VStack{
                    
                    if self.index != 2{
                        
                        Image(systemName: "person.crop.circle").foregroundColor(Color.black.opacity(0.2))
                    }
                    else{
                        
                        ZStack{
                            
                            Circle()
                                .foregroundColor(Color.white)
                                .frame(width: 62, height: 62)
                                .offset(y:-10)
                            
                            
                            
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .frame(width: width/20, height: height/45)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color("color1"))
                                .clipShape(Circle())
                                .offset(y: -20)
                                .padding(.bottom, -20)
                        }
                        Text("Profile").foregroundColor(Color.black.opacity(0.7))
                            .font(Font.custom("Poppins-Light", size: 10))
                            .offset(y: -12)
                    }
                }
                
                
            }
            Spacer(minLength: 0)
            
            Button(action: {
                self.index = 3
                
            }){
                
                VStack{
                    
                    if self.index != 3{
                        
                        Image(systemName: "gear").foregroundColor(Color.black.opacity(0.2))
                    }
                    else{
                        ZStack{
                            
                            Circle()
                                .foregroundColor(Color.white)
                                .frame(width: 62, height: 62)
                                .offset(y:-10)
                            
                            Image(systemName: "gear")
                                .resizable()
                                .frame(width: width/20, height: height/45)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color("color1"))
                                .clipShape(Circle())
                                .offset(y: -20)
                                .padding(.bottom, -20)
                        }
                        Text("Settings").foregroundColor(Color.black.opacity(0.7))
                            .font(Font.custom("Poppins-Light", size: 10))
                            .offset(y: -12)
                        
                    }
                }
                
                
            }
        }
        .padding(.horizontal, 25)
        .padding(.vertical, 0)
        .background(Color.white)
        .offset(y:35)
        
    }
}

