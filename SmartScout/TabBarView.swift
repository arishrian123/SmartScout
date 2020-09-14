//
//  TabBarView.swift
//  SmartScout
//
//  Created by Arish Tripathi on 05/09/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
    
    var data: VideoStore
    
    var body: some View {
        TabView {
            Home(data: data)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }.tag(0)
            
            SearchView()
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("Search")
            }.tag(1)
            
            
            AddNewVideoView()
            .tabItem {
                Image(systemName: "plus.rectangle.on.rectangle")
                Text("Add new video")
            }.tag(2)
            
            ProfileView()
            .tabItem {
                Image(systemName: "person.crop.circle")
                Text("Profile")
            }.tag(3)
            
            SettingsView()
                .tabItem{
                    Image(systemName: "gear")
                    Text("Settings")
            }.tag(4)
        }
    }
}
