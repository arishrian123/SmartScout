//
//  Home.swift
//  SmartScout
//
//  Created by Arish Tripathi on 30/08/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI
import AVKit

struct Home : View {
    
    @State var index = 0
    @State var top = 0
    @State var profileIsPressed = false
    
    @ObservedObject var data = VideoStore()
    
    var body: some View{
        
        ZStack{
                        
            PlayerScrollView(data: self.data)
                    
            VStack{
                
                HStack(spacing: 15){
                    
                    Button(action: {
                        
                        self.top = 0
                        
                    }) {
                        
                        Text("Star Videos")
                            .foregroundColor(self.top == 0 ? .white : Color.white.opacity(0.45))
                            .fontWeight(self.top == 0 ? .bold : .none)
                            .padding(.vertical)
                    }
                    
                    Button(action: {
                        
                        self.top = 1
                        
                    }) {
                        
                        Text("Normal Videos")
                            .foregroundColor(self.top == 1 ? .white : Color.white.opacity(0.45))
                            .fontWeight(self.top == 1 ? .bold : .none)
                            .padding(.vertical)
                    }
                }
                
                Spacer()
                
                HStack{
                    
                    Spacer()
                    
                    VStack(spacing: 35){
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("ollie")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 55, height: 55)
                            .clipShape(Circle())
                        }
                        
                        Button(action: {
                            
                        }) {
                            
                            VStack(spacing: 8){
                                
                                Image(systemName: "message.fill")
                                    .font(.title)
                                    .foregroundColor(.white)
                                
                                Text("1021")
                                    .foregroundColor(.white)
                            }
                        }
                        
                        Button(action: {
                            
                        }) {
                            
                            VStack(spacing: 8){
                                
                                Image(systemName: "arrowshape.turn.up.right.fill")
                                    .font(.title)
                                    .foregroundColor(.white)
                                
                                Text("Share")
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .padding(.bottom, 55)
                    .padding(.trailing)
                }
                
            }
                
            // due to all edges are ignored...
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .padding(.bottom, (UIApplication.shared.windows.first?.safeAreaInsets.bottom)! + 5)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.all)
    }
}