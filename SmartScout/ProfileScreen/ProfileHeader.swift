//
//  ProfileHeader.swift
//  SmartScout
//
//  Created by Arish Tripathi on 04/09/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

struct ProfileHeader: View {
    let gradient = Gradient(colors: [.red, .orange])
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                VStack {
                    Image("ollie")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .clipped()
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .padding(.top, 60)
                    
                    Text("Oliver Cordingley").font(.system(size: 20)).bold().foregroundColor(.white)
                        .padding(.top, 12)
                    
                    Text("@ollie").font(.system(size: 18)).foregroundColor(.white)
                    .padding(.top, 4)
                }
                Spacer()
            }
            Spacer()
        }
        .background(LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeader()
    }
}
