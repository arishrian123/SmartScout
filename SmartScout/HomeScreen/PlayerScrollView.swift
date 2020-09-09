//
//  PlayerScrollView.swift
//  SmartScout
//
//  Created by Arish Tripathi on 30/08/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI
import AVKit

struct PlayerScrollView : UIViewRepresentable {
    
    
    func makeCoordinator() -> Coordinator {
        
        return PlayerScrollView.Coordinator(parent1: self)
    }
    
    @ObservedObject var data = VideoStore()
    
    func makeUIView(context: Context) -> UIScrollView{
        
        let view = UIScrollView()
        
        let childView = UIHostingController(rootView: PlayerView(data: self.data))
        
        // each children occupies one full screen so height = count * height of screen...
        
        childView.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.videos.count)))
        
        // same here...
        
        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.videos.count)))
        
        view.addSubview(childView.view)
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        
        // to ignore safe area...
        view.contentInsetAdjustmentBehavior = .never
        view.isPagingEnabled = true
        view.delegate = context.coordinator
        
        return view
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
        // to dynamically update height based on data...
        
        uiView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.videos.count)))
        
        for i in 0..<uiView.subviews.count{
            
            uiView.subviews[i].frame = CGRect(x: 0, y: 0,width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.videos.count)))
        }
    }
    
}
