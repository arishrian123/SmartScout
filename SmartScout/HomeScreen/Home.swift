//
//  Home.swift
//  SmartScout
//
//  Created by Arish Tripathi on 30/08/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI
import AVKit
import UserNotifications

struct Home : View {
    
    @State var index = 0
    @State var top = 0
    @State var profileIsPressed = false
    @State var ageType = 0
    @State var locationType = 0
    
    
    var ageTypes = ["U4","U5","U6","U7","U8","U9","U10","U11","U12","U13","U14","U15","U16"]
    
    var locationTypes = ["UK","Europe","Africa","Asia","Oceania","Americas"]
    
    @ObservedObject var data = VideoStore()
    
    @ObservedObject var firestoreData = FirestoreData()
    
    func showNotification() {
        
        let content = UNMutableNotificationContent()
        content.title = "A scout has liked your video"
        content.subtitle = "Check who!"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (Error) in
            if let error = Error{
                print("\(error.localizedDescription)")
            }
        }
        
    }
    
    var body: some View{
        
        ZStack{
            
            PlayerScrollView(data: self.data)
                .onAppear{
                    DispatchQueue.main.async {
                        
                        var repeats: Bool = self.firestoreData.liked
                        
                         var done: Bool = true
                        
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: done) { timer in

                            while done{
                            if(self.firestoreData.liked && self.firestoreData.userType == "Parent"){
                                self.showNotification()
                                done = false
                            } else {
                                done = true
                            }
                            }
                        }
                        
                        
                    }
                      
            }
            
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
                
                // due to all edges are ignored...
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .padding(.bottom, (UIApplication.shared.windows.first?.safeAreaInsets.bottom)! + 5)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.all)
    }

}
