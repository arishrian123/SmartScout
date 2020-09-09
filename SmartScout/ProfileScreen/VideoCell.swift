//
//  VideoCell.swift
//  SmartScout
//
//  Created by Arish Tripathi on 04/09/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI
import AVKit

struct VideoCell: View {
    var data: Video
    var index: Int = 0
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                
                Player(player: self.data.player)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                .clipped()
            }
        }
    }
}


