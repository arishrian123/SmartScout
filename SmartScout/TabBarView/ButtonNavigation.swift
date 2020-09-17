//
//  ButtonNavigation.swift
//  SmartScout
//
//  Created by Oliver Cordingley on 16/09/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//
import SwiftUI

struct ButtonNavigation: View {
    
    @State var index = 0
    var body: some View {
        
        VStack{
            
            Spacer()
            
            CustomTab(index: self.$index)
        }
        .background(Color.black.opacity(0.1).edgesIgnoringSafeArea((.top)))
    }
}

struct ButtonNavigation_Previews: PreviewProvider {
    static var previews: some View {
        ButtonNavigation()
    }
}

struct CustomTab : View {
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    @Binding var index : Int
    @State var showMenu = false

 
    var body : some View {
    
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
        }
        .padding(.horizontal, 25)
        .padding(.vertical, 0)
        .background(Color.white)
        .offset(y:35)
        
    }
}



