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
    
    func login() {
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if let error = error {
                self.isSuccess = false
                print(error.localizedDescription)
            } else {
                
                
                self.isSuccess = true
            }
        }
    }
    
    var body: some View {
        ZStack{
            Color.init("color1").edgesIgnoringSafeArea(.all)
            
            HStack {
                VStack{
                    Text("Login")
                        .font(.system(size: 40, weight: .bold, design: .default))
                        .foregroundColor(Color.white)
                    
                    VStack{
                        
                    TextField("Email", text: $email)
                        .background(Color.white)
                        
                    SecureField("Password", text: $password)
                        .background(Color.white)
                        
                        Picker(selection: $userType, label: Text("Select")){
                            ForEach(0 ..< userTypes.count){
                                Text(self.userTypes[$0])
                            }
                        }
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
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
