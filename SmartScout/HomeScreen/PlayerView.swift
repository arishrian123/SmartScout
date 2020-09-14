//
//  PlayerView.swift
//  SmartScout
//
//  Created by Arish Tripathi on 30/08/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI
import AVKit
import FirebaseFirestore
import UserNotifications
import FirebaseAuth

struct PlayerView : View {
    
    @ObservedObject var data = VideoStore()
    @ObservedObject var firestoreData = FirestoreData()
    
    @State var liked: Bool = false
    
    let db = Firestore.firestore()
    let user = Auth.auth().currentUser
        
    func likedToDB(){
        
        if (user != nil) {
        if liked{
            db.collection("users").document("MvqHJkYNMXT4wcAsdnEEHVTx6tC3").updateData(["liked": true])
        }
        else{
            db.collection("users").document("MvqHJkYNMXT4wcAsdnEEHVTx6tC3").updateData(["liked": false])
        }
        }

    }
    
    
    
    var body: some View{
        
        VStack(spacing: 0){
            
            ForEach(0..<self.data.videos.count, id: \.self){i in
                
                ZStack{

                    Player(player: self.data.videos[i].player)
                        // full screensize because were going to make paging...
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        .offset(y: -5)
                    
                    if self.data.videos[i].replay{
                        
                        Button(action: {
                            
                            // playing the video again...
                            
                            self.data.videos[i].replay = false
                            self.data.videos[i].player.seek(to: .zero)
                            self.data.videos[i].player.play()
                            
                        }) {
                            
                            Image(systemName: "goforward")
                            .resizable()
                            .frame(width: 55, height: 60)
                            .foregroundColor(.white)
                        }
                        
                        if(self.firestoreData.userType == "Scout"){
                        Button(action: {
                            self.liked.toggle()
                            self.likedToDB()
                            self.data.videos[i].liked.toggle()
                            
                        }) {
                            
                            VStack(spacing: 8){
                                
                                Image(systemName: "suit.heart.fill")
                                    .font(.title)
                                    .foregroundColor(self.liked ? .red : .white)
                                    .scaleEffect(self.liked ? 2 : 1)
                                
                            }
                        }.offset(x: 150, y: 0)
                        }
                        
                    }
                }
            }
        }
        .onAppear {

 
            if !self.data.isEmpty {
                    
                
            self.data.videos[0].player.play()
            
            self.data.videos[0].player.actionAtItemEnd = .none
            
            NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.data.videos[0].player.currentItem, queue: .main) { (_) in
                
                // notification to identify at the end of the video...
                
                // enabling replay button....
                self.data.videos[0].replay = true
            }
            
            
            }
        }
    }
}
