//
//  ProfileHeader.swift
//  SmartScout
//
//  Created by Arish Tripathi on 04/09/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

struct ProfileHeader: View {
    
    @ObservedObject var firestoreData = FirestoreData()
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                VStack {
                    Image("pic")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .clipped()
                        .overlay(Circle().stroke(Color("12grey"), lineWidth: 4))
                        .padding(.top, 60)
                        .zIndex(1)
                    
                    Text("Erik Bognar").font(Font.custom("Poppins-Medium", size: 25))
                    Text(firestoreData.name).font(Font.custom("Poppins-Medium", size: 25))

                        .foregroundColor(.white)
                        .padding(.top, 12)
                    
                    Text("@e_bognar")
                        .font(Font.custom("Poppins-Light", size: 15))
                        .foregroundColor(.orange)
                        .opacity(0.7)
                        .padding(.top, 4)
                }
                Spacer()
            }
            Spacer()
        }
        
}
}
struct ProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeader()
    }
}
