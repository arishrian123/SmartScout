//
//  tabBarView.swift
//  SmartScout
//
//  Created by Oliver Cordingley on 07/10/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

struct tabBarView: View {
    @State var show = false
    var body: some View {
        
        ZStack{
            VStack{
                
                Button(action: {
                    self.show.toggle()
                }) {

                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(20)
                .foregroundColor(Color("13grey"))
                }

                .background(Color("11grey"))
                .clipShape(Circle())
                
                
                Text("Profile")
                     .foregroundColor(Color(("11grey")))
                
            }.offset(x: UIScreen.main.bounds.width - 250, y: UIScreen.main.bounds.height - 1250)
            
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
