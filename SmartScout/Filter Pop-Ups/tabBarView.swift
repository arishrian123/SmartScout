//
//  tabBarView.swift
//  SmartScout
//
//  Created by Oliver Cordingley on 07/10/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

struct tabBarView: View {
    var body: some View {
        
        ZStack{
            
            filterButton()
            addItemView()
            statsView()
        
        }
    }
}

struct tabBarView_Previews: PreviewProvider {
    static var previews: some View {
        tabBarView()
    }
}
