//
//  FilterAgeView.swift
//  SmartScout
//
//  Created by Oliver Cordingley on 03/10/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

struct FilterAgeView: View {
    
    var body: some View {
    
    VStack(alignment: .leading, spacing: 10) {
    
    
    Button(action: {
        
    }) {
        
            Text("U5")
    }
        
    Divider()
        
    Button(action: {
        
    }) {
            Text("U6")
        
    }
        
        Divider()
        
        Button(action: {
            
        }) {
                Text("U7")
            
        }
            
            Divider()
        
        Button(action: {
            
        }) {
                Text("U8")
            
        }
            
            Divider()
        
        Button(action: {
            
        }) {
                Text("U9")
            
        }
            
            Divider()
        
        
        
        }     .foregroundColor(.black)
               .frame(width: 110, height: 145)
               .padding()
    
        
    }
}
        
struct FilterAgeView_Previews: PreviewProvider {
    static var previews: some View {
        FilterAgeView()
    }
}
