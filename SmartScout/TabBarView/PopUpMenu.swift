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
        
        HStack(spacing: 50) {
            
            ZStack {
                
                Circle()
                    .foregroundColor(Color.blue)
                    .frame(width: 50, height: 50)
                Image(systemName: "camera")
                    .resizable()
                    .padding(20)
                    .frame(width: 50, height: 50)
                    .foregroundColor(.white)
            }
            ZStack{
                Circle()
                    .foregroundColor(Color.blue)
                    .frame(width: 50, height: 50)
                Image(systemName: "photo")
                    .resizable()
                    .padding(20)
                    .frame(width: 50, height: 50)
                    .foregroundColor(.white)
            }
            } .transition(.scale)
        }

    }
struct PopUpMenu_Previews: PreviewProvider {
    static var previews: some View {
        PopUpMenu()
    }
}


