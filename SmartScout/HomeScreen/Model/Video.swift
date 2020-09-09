//
//  Video.swift
//  SmartScout
//
//  Created by Arish Tripathi on 30/08/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI
import AVKit

struct Video : Identifiable {
    
    var id : Int
    var player : AVPlayer
    var replay : Bool
    var liked: Bool
}
