//
//  Coordinator.swift
//  SmartScout
//
//  Created by Arish Tripathi on 30/08/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import Foundation
import SwiftUI

class Coordinator : NSObject,UIScrollViewDelegate{
    
    var parent : PlayerScrollView
    var index = 0
    
    init(parent1 : PlayerScrollView) {
        
        parent = parent1
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let currenrindex = Int(scrollView.contentOffset.y / UIScreen.main.bounds.height)
        
        if index != currenrindex{
            
            index = currenrindex
            
            for i in 0..<parent.data.videos.count {
                
                // pausing all other videos...
                parent.data.videos[i].player.seek(to: .zero)
                parent.data.videos[i].player.pause()
            }
            
            // playing next video...
            
            parent.data.videos[index].player.play()
            
            parent.data.videos[index].player.actionAtItemEnd = .none
            
            NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: parent.data.videos[index].player.currentItem, queue: .main) { (_) in
                
                // notification to identify at the end of the video...
                
                // enabling replay button....
                self.parent.data.videos[self.index].replay = true
            }
        }
    }
}
