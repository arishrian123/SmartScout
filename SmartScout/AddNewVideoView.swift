//
//  AddNewVideoView.swift
//  SmartScout
//
//  Created by Arish Tripathi on 05/09/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

struct AddNewVideoView: View {
    
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()
    
    var body: some View {
        VStack {
        
                   Image(uiImage: self.image)
                       .resizable()
                       .scaledToFill()
                       .frame(minWidth: 0, maxWidth: .infinity)
                       .edgesIgnoringSafeArea(.all)
        
                   Button(action: {
                       self.isShowPhotoLibrary = true
                   }) {
                       HStack {
                           Image(systemName: "photo")
                               .font(.system(size: 20))
        
                           Text("Photo library")
                               .font(.headline)
                       }
                       .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                       .background(Color.blue)
                       .foregroundColor(.white)
                       .cornerRadius(20)
                       .padding(.horizontal)
                   }
               }
    }
}

struct AddNewVideoView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewVideoView()
    }
}
