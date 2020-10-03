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
            
            Pop()
            
            /*VStack{
                Text("SmartScout")
                
            }.frame(width: 200, height: 100)
            .background(BlurView(style: .regular))
            .zIndex(1)*/
            
            if(self.firestoreData.liked && self.firestoreData.userType == "Parent") {
                
                Text("")
                    .onAppear{
                        self.showNotification()
                    }
            }
            
            PlayerScrollView(data: self.data)
            
                HStack{
                    
                    Spacer()
                    
                    
                
                
            }
                
                // due to all edges are ignored...
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .padding(.bottom, (UIApplication.shared.windows.first?.safeAreaInsets.bottom)! + 5)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.all)
    }

}
