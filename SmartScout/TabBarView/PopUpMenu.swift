//
//  PopUpMenu.swift
//  SmartScout
//
//  Created by Oliver Cordingley on 16/09/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

struct PopUpMenu: View {
    var body: some View {
        
        HStack(spacing: 40) {
            
            ZStack {
                
                Circle()
                    .foregroundColor(Color.blue)
                    .frame(width: 60, height: 60)
                
                Image(systemName: "camera")
                    .resizable()
                    .padding(20)
                    .frame(width: 65, height: 60)
                    .foregroundColor(.white)
            }
            
            ZStack{
                
                Circle()
                    .foregroundColor(Color.blue)
                    .frame(width: 60, height: 60)
                
                
                Image(systemName: "photo")
                    .resizable()
                    .padding(20)
                    .frame(width: 65, height: 60)
                    .foregroundColor(.white)
            }
            
            }
        }

    }
struct PopUpMenu_Previews: PreviewProvider {
    static var previews: some View {
        PopUpMenu()
    }
}


