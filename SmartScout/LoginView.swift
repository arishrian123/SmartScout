//
//  LoginView.swift
//  SmartScout
//
//  Created by Arish Tripathi on 13/09/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    @State var isSuccess = false
    @State var userType = 0
    var userTypes = ["Parent", "Scout"]
    let db = Firestore.firestore()
    var data: VideoStore
    
    func login() {
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if let error = error {
                self.isSuccess = false
                print(error.localizedDescription)
            } else if let result = result {
                
                /*self.db.collection("users")
                    .document(result.user.uid)
                    .setData(["email": self.email,
                              "type": self.userTypes[self.userType]])*/
                
                self.isSuccess = true
            }
        }
    }
    
    var body: some View {
        
        ZStack{
        if !isSuccess {
        ZStack{
            Color.init("color1").edgesIgnoringSafeArea(.all)
            
            HStack {
                VStack{
                    Text("Login")
                        .font(.system(size: 40, weight: .bold, design: .default))
                        .foregroundColor(Color.white)
                    
                    VStack{
                        
                        TextField("Email", text: $email)
                        
                        
                    SecureField("Password", text: $password)
                        
                        
                        /*Picker(selection: $userType, label: Text("Select")){
                            ForEach(0 ..< userTypes.count){
                                Text(self.userTypes[$0])
                            }
                        }*/
                    }
                    
                    Button(action: {
                        self.login()
                    }){
                        Text("Click")
                        .font(.system(size: 40, weight: .bold, design: .default))
                        .foregroundColor(Color.white)
                    }
                    
                    Spacer()
                }
                
                
                
            }.padding()
            
            
        }
        } else {
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
