//
//  VideoStore.swift
//  SmartScout
//
//  Created by Arish Tripathi on 04/09/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import Foundation
import AVKit
import Combine
import FirebaseStorage


class VideoStore: ObservableObject {
    @Published var videos = [Video]()
    @Published var isEmpty = true
    
    let storage = Storage.storage()
    
    init(){
        
        self.updateData()
        print(videos.count)
    }
    
        func updateData(){
        
        let storage = Storage.storage()
            
            storage.reference().child("Videos").listAll { (res, err) in
                
            
            if err != nil{
                
                print((err?.localizedDescription)!)
                self.isEmpty = true
                self.videos.append(Video(id: 0, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video1", ofType: "mp4")!)), replay: false, liked: false))
                self.videos.append(Video(id: 1, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video2", ofType: "mp4")!)), replay: false, liked: false))
                self.videos.append(Video(id: 2, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video3", ofType: "mp4")!)), replay: false, liked: false))
                return
            }
            
            if res.items.isEmpty{
                
                self.isEmpty = true
                
            }
            
            for i in 0..<res.items.count{
                
                
                let name = res.items[i].name
                
                res.items[i].getMetadata { (meta, err) in
                    
                    if err != nil{
                        
                        print((err?.localizedDescription)!)
                        return
                    }
                    
                    let type = meta?.contentType
                    
                    res.items[i].downloadURL { (url, err) in
                        
                        if err != nil{
                            
                            print((err?.localizedDescription)!)
                            return
                        }
                        
                        DispatchQueue.main.async {
                            
                            self.videos.append(Video(id: i, player: AVPlayer(url: url!), replay: false, liked: false))

                            
                            if self.videos.count >= 1 {
                                self.isEmpty = false
                        }
                    }
                }
            }
    }
}

}
}
