//
//  Login2.swift
//  SmartScout
//
//  Created by Oliver Cordingley on 18/09/2020.
//  Copyright © 2020 Curzen Technologies. All rights reserved.
//


import SwiftUI

struct Login2: View {
    var body: some View {
        FirstView()
            .edgesIgnoringSafeArea(.all)
            .statusBar(hidden: true)
    }
}

struct Login2_Previews: PreviewProvider {
    static var previews: some View {
        
        Login2()
    }
}

struct FirstView : View {
    
    @State var signUp = false
    @State var user = ""
    @State var pass = ""
    @State var rePass = ""
    @State var gradient = [Color("color2"), Color("color1")]
    
    var body: some View{
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
            
            ZStack{
                
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
                    
                    Color("color1")
                        .clipShape(CShape())
                    
                    
                    Path{path in
                        
                        
                        path.addArc(center: CGPoint(x: UIScreen.main.bounds.width - 120 , y: UIScreen.main.bounds.height - 50), radius: 40, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: true)
                    }
                    .fill(Color.white)
                    
                    
                    Button(action: {
                        
                        withAnimation(.easeIn){
                            
                            self.signUp = false
                        }
                        
                    }) {
                        
                        Image(systemName: signUp ? "xmark" : "person.fill")
                            .font(Font.custom("Poppins-Light", size: 25))
                            .foregroundColor(Color("color1"))
                    }
                    .offset(x: -110, y: -50)
                        
                    .disabled(signUp ? false : true)
                    
                    Button(action: {
                        
                        withAnimation(.easeOut){
                            
                            self.signUp = true
                        }
                        
                    }) {
                        
                        Image(systemName: signUp ? "person.badge.plus.fill" : "xmark")
                            .font(Font.custom("Poppins-Light", size: 25))
                            .foregroundColor(.white)
                    }
                    .offset(x: -30, y: -40)
                    .disabled(signUp ? true : false)
                }
                
                VStack(alignment: .leading, spacing: 25) {
                    
                    Text("Login")
                        .font(Font.custom("Poppins-SemiBold", size: 35))
                        .foregroundColor(.white)
                    
                    Text("Username")
                        .font(Font.custom("Poppins-Light", size: 20))
                        .foregroundColor(.white)
                        .padding(.top,10)
                    
                    VStack{
                        
                        TextField("Useraname", text: $user)
                            .font(Font.custom("Poppins-Light", size: 15))
                        
                        Divider()
                            
                            .background(Color.white.opacity(0.5))
                    }
                    
                    Text("Password")
                        .font(Font.custom("Poppins-Light", size: 20))
                        .foregroundColor(.white)
                        .padding(.top,10)
                    
                    VStack{
                        
                        SecureField("Password", text: $pass)
                            .font(Font.custom("Poppins-Light", size: 15))
                        
                        Divider()
                            .background(Color.white.opacity(0.5))
                    }
                    
                    HStack{
                        
                        Spacer()
                        
                        Button(action: {}) {
                            
                            Text("Login")
                                .fontWeight(.bold)
                                .font(Font.custom("Poppins-SemiBold", size: 25))
                                .foregroundColor(Color("color1"))
                                .padding(.vertical)
                                .padding(.horizontal,45)
                                .background(Color.white)
                                .clipShape(Capsule())
                        }
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                    Spacer(minLength: 0)
                }
                .padding(.top,(UIApplication.shared.windows.first?.safeAreaInsets.top)! + 25)
                .padding()
                
            }
            .offset(y: signUp ? -UIScreen.main.bounds.height + (UIScreen.main.bounds.height < 750 ? 100 : 130) : 0)
            .zIndex(1)
            
            
            VStack(alignment: .leading, spacing: 25) {
                
                Text("Sign Up")
                    .font(Font.custom("Poppins-SemiBold", size: 35))
                    .foregroundColor(Color("color1"))
                
                Text("Username")
                    .font(Font.custom("Poppins-Light", size: 20))
                    .foregroundColor(Color("color1"))
                    .padding(.top,10)
                
                VStack{
                    
                    TextField("Useraname", text: $user)
                        .font(Font.custom("Poppins-Light", size: 15))
                    
                    Divider()
                        .background(Color("color1").opacity(0.5))
                }
                
                Text("Password")
                    .font(Font.custom("Poppins-Light", size: 20))
                    .foregroundColor(Color("color1"))
                    .padding(.top,10)
                
                VStack{
                    
                    SecureField("Paswword", text: $pass)
                        .font(Font.custom("Poppins-Light", size: 15))
                    
                    Divider()
                        .background(Color("color1").opacity(0.5))
                }
                
                Text("Re-Enter")
                    .font(Font.custom("Poppins-Light", size: 20))
                    .foregroundColor(Color("color1"))
                    .padding(.top,10)
                
                
                VStack{
                    
                    SecureField("Re-Enter", text: $rePass)
                        .font(Font.custom("Poppins-Light", size: 15))
                    
                    Divider()
                        .background(Color("color1").opacity(0.5))
                    
                }
                
                VStack{
                    
                    Spacer()
                    
                    
                    Button(action: {}) {
                        
                        Text("Sign Up")
                            
                            .font(Font.custom("Poppins-SemiBold", size: 25))
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .padding(.horizontal,45)
                            .background(Color("color1"))
                            .clipShape(Capsule())
  
                    }.offset(x: 30)
                    
                    Spacer()
                
                    ZStack{
                        
                         Image("White Logo Square")
                            .zIndex(1)
                            .offset(x: -120)

                    Button(action: {}) {
                        
                        Text("Sign in with Apple")
                            
                            .fontWeight(.medium)
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .padding(.horizontal,90)
                            .background(Color(.black))
                            .clipShape(RoundedRectangle(cornerRadius: 5 ))
                        
                       
                    }.offset(x: 20)
                        
                        
                    }
                    
                    Spacer()
                }
                .padding(.top)
                
                Spacer(minLength: 0)
            }
            .padding(.top,(UIApplication.shared.windows.first?.safeAreaInsets.top)! + 50)
            .padding()
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
            
        .preferredColorScheme(signUp ? .light : .dark)
    }
}

struct CShape : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path{path in
            
            
            path.move(to: CGPoint(x: rect.width, y: rect.height - 50))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height - 50))
            
            path.addArc(center: CGPoint(x: rect.width - 40, y: rect.height - 50), radius: 40, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: false)
        }
    }
}


