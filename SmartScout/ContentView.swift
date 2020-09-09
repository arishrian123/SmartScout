//
//  ContentView.swift
//  SmartScout
//
//  Created by Arish Tripathi on 25/08/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI
import AVKit

struct ContentView: View {
    
    @State var isVisible: Bool
    @EnvironmentObject var data: VideoStore
    
    var body: some View {
        ZStack{
        if isVisible {
            SplashScreen()
                            
        } else{
            TabBarView(data: data)
        }
        }
        .onAppear{
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isVisible.toggle()
        }
        }
    }
}
