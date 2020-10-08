//
//  Login2.swift
//  SmartScout
//
//  Created by Oliver Cordingley on 18/09/2020.
//  Copyright © 2020 Curzen Technologies. All rights reserved.
//


import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct Login2: View {
    
    var data: VideoStore
    @State var signUp = false
    @State var user = ""
    @State var pass = ""
    @State var rePass = ""
    @State var gradient = [Color("1red"), Color("1orange")]
    @State var startPoint = UnitPoint(x: 1.75, y: 0)
    @State var endPoint = UnitPoint(x: -1, y: 0)
    
    let db = Firestore.firestore()
    @ObservedObject var loginViewModel = LoginViewModel()
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    func login() {
        
        Auth.auth().signIn(withEmail: user, password: pass) { (result, error) in
            
            if let error = error {
                self.loginViewModel.isLoggedIn = false
                print(error.localizedDescription)
            } else if let result = result {
                
                /*self.db.collection("users")
                 .document(result.user.uid)
                 .setData(["email": self.email,
                 "type": self.userTypes[self.userType]])*/
                
                self.loginViewModel.isLoggedIn = true
                
            }
        }
    }
    
    
    var body: some View {
        
        ZStack{
            if !loginViewModel.isLoggedIn {
                
                ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
                    
                    ZStack{
                        
                        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
                            
                            (LinearGradient(gradient: Gradient(colors: self.gradient), startPoint: self.startPoint, endPoint: self.endPoint))
                                
                                .clipShape(CShape())
                            
                            
                            Path{path in
                                
                                
                                path.addArc(center: CGPoint(x: UIScreen.main.bounds.width - 120 , y: UIScreen.main.bounds.height - 50), radius: 40, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: true)
                            }
                            .fill(Color("11grey"))
                            
                            Button(action: {
                                
                                withAnimation(.easeIn){
                                    
                                    self.signUp = false
                                }
                                
                            }) {
                                
                                Image(systemName: signUp ? "xmark" : "person.fill")
                                    .font(Font.custom("Poppins-Light", size: 25))
                                    .foregroundColor(Color.white)
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
                                    .foregroundColor(Color("11grey"))
                            }
                            .offset(x: -30, y: -40)
                            .disabled(signUp ? true : false)
                        }
                        
                        VStack(alignment: .leading, spacing: 25) {
                            
                            Image("SmartScout_white")
                            .resizable()
                                .frame(width: 200, height: 50)
                                .offset(x: width/4.5, y: -29)

                            
                            Text("Login")
                                .font(Font.custom("Poppins-SemiBold", size: 35))
                                .foregroundColor(Color("11grey"))
                            
                            Text("Username")
                                .font(Font.custom("Poppins-Light", size: 20))
                                .foregroundColor(Color("11grey"))
                                .padding(.top,10)
                            
                            VStack{
                                
                                TextField("Username", text: $user)
                                    .font(Font.custom("Poppins-Light", size: 15))
                                
                                
                                Divider()
                                    
                                    .background(Color.white.opacity(0.5))
                            }
                            
                            Text("Password")
                                .font(Font.custom("Poppins-Light", size: 20))
                                .foregroundColor(Color("11grey"))
                                .padding(.top,10)
                            
                            VStack{
                                
                                SecureField("Password", text: $pass)
                                    .font(Font.custom("Poppins-Light", size: 15))
                                
                                Divider()
                                    .background(Color.white.opacity(0.5))
                            }
                            
                            HStack{
                                
                                Spacer()
                                
                                Button(action: {
                                    self.login()
                                    }) {
                                    
                                    Text("Login")
                                        .fontWeight(.bold)
                                        .font(Font.custom("Poppins-SemiBold", size: 22.5))
                                        .foregroundColor(Color.white)
                                        .offset(x: -95)
                                        .padding(.vertical, 7)
                                        .padding(.horizontal, 145)
                                        .background(Color("11grey"))
                                        .clipShape(Capsule())
                                }.offset(x: width/5)
                                
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
                            .foregroundColor(Color.white)
                        
                        Text("Username")
                            .font(Font.custom("Poppins-Light", size: 20))
                            .foregroundColor(Color.white)
                            .padding(.top,10)
                        
                        VStack{
                            
                            TextField("Username", text: $user)
                                .font(Font.custom("Poppins-Light", size: 15))
                            
                            Divider()
                                .background(Color.white.opacity(0.5))
                        }
                        
                        Text("Password")
                            .font(Font.custom("Poppins-Light", size: 20))
                            .foregroundColor(Color.white)
                            .padding(.top,10)
                        
                        VStack{
                            
                            SecureField("Paswword", text: $pass)
                                .font(Font.custom("Poppins-Light", size: 15))
                            
                            Divider()
                                .background(Color.white.opacity(0.5))
                        }
                        
                        /*Text("Re-Enter")
                            .font(Font.custom("Poppins-Light", size: 20))
                            .foregroundColor(Color.white)
                            .padding(.top,10)*/
                        
                        
                        VStack{
                            
                            SecureField("Re-Enter", text: $rePass)
                                .font(Font.custom("Poppins-Light", size: 15))
                            
                            Divider()
                                .background(Color.white.opacity(0.5))
                            
                        }
                        
                        VStack{
                            
                            Spacer()
                            
                            
                            Button(action: {}) {
                                
                                Text("Sign Up")
                                    
                                    .font(Font.custom("Poppins-SemiBold", size: 22.5))
                                    .foregroundColor(Color("11grey"))
                                    .offset(x: 95)
                                    .padding(.vertical, 7)
                                    .padding(.horizontal, 145)
                                    .background(Color.white)
                                    .clipShape(Capsule())
                                
                            }.offset(x: -width/5)
                            
                            Spacer()
                            
                            ZStack{
                                
                                Image("White Logo Square")
                                    .zIndex(1)
                                    .offset(x: -120, y: 1)
                                
                                Button(action: {
                                    
                                }) {
                                    
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
                .background(Color("11grey").edgesIgnoringSafeArea(.all))
                .edgesIgnoringSafeArea(.all)
                .statusBar(hidden: true)
            } else {
                Home()
                
            }
        }
        
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

struct login2_Previews: PreviewProvider {
    static var previews: some View {
        Login2(data: VideoStore())
    }
}



