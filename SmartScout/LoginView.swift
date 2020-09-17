//
//  LoginView.swift
//  SmartScout
//
//  Created by Arish Tripathi on 13/09/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import FirebaseAuth
import FirebaseFirestore

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    @State var isSuccess = false
    @State var userType = 0
    @State var moveAlongCircle = false
    var userTypes = ["Parent", "Scout"]
    let db = Firestore.firestore()
    var data: VideoStore
    @ObservedObject var loginViewModel = LoginViewModel()
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    func login() {
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
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
            if !loginViewModel.isLoggedIn{
                ZStack {
                    
                    Circle()
                        .frame( width: width/3, height: height/3)
                        .foregroundColor(Color("color1"))
                        .offset(x: width/1.9, y: height/(-2.8))
                        .shadow(radius: 10)
                    
                    Circle()
                        .frame( width: width/8.5, height: height/8.5)
                        .foregroundColor(Color("color1"))
                        .offset(x: width/4, y: height/(-2.8))
                        .shadow(radius: 10)
                    
                    Circle()
                        .frame( width: width/3, height: height/3)
                        .foregroundColor(Color("color1"))
                        .offset(x: -width/1.9, y: height/2.45)
                        .shadow(radius: 10)
                                      
                    
                    Circle()
                        .frame( width: width/8.5, height: height/8.5)
                        .foregroundColor(Color("color1"))
                        .offset(x: -width/4, y: height/2.45)
                        .shadow(radius: 10)
                                      
                    
                    Text("Sign Up")
                        .foregroundColor(Color.black)
                        .font(Font.custom("Poppins-SemiBold", size: 35))
                        .offset(x: width/4, y: height/2.45)
                    
                    Text("Login")
                        .font(Font.custom("Poppins-Semibold", size: 40))
                        .offset(x: -130, y: -320)
                    
                    VStack {
                        
                        HStack{
                            Text("Smart")
                                .foregroundColor(Color.black)
                                .font(Font.custom("Poppins-Light", size: 25))
                                .offset(x: 5)
                            
                            Text("Scout")
                                .foregroundColor(Color.black)
                                .font(Font.custom("Poppins-Medium", size: 25))
                                .offset(x: -5)
                        }
                        VStack {
                        
                            VStack(alignment: .leading) {
                        
                                HStack {
                                    
                                    TextField("  Email", text: $email)
                                        .font(Font.custom("Poppins-Light", size: 20))
                                        .frame(width: width/1.12, height: height/18)
                                    
                                    
                                }.background(BlurView(style: .light))
                                    
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                
                                HStack {
                                    SecureField("  Password", text: $password)
                                        .font(Font.custom("Poppins-Light", size: 20))
                                        .frame(width: width/1.12, height: height/18)
                                    
                                    
                                }.background(BlurView(style: .light))
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                
                                HStack {
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        self.login()
                                    }){
                                        Text("Login")
                                        .font(Font.custom("Poppins-Light", size: 20))
                                        .foregroundColor((Color("color1")))
                                    }
                                    .padding()
                                    
                                }.padding(.trailing, 20)
                            }.padding()
                        }
                        .frame(width: width/1.05, height: height/4)
                        .background(BlurView(style: .regular))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                        .padding(.top, height/3.5)
                              Spacer()
                        
                    }
                }
   
            }
            else {
                TabBarView(data: data)
            }
        }
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(data: VideoStore())
    }
}
