//
//  SettingsDetailView.swift
//  SmartScout
//
//  Created by Arish Tripathi on 17/09/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

struct SettingsDetailView: View {
    
    var item: MenuItem
    @ObservedObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        
        Button(action: {
            self.loginViewModel.isLoggedIn = false
        }){
            Text(item.name)
        }
    }
}
