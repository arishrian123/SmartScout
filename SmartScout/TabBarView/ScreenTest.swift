//
//  ScreenTest.swift
//  SmartScout
//
//  Created by Oliver Cordingley on 17/09/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

struct ScreenTest: View {
    
    @State var sheetPresent = false
    
    var body: some View {
        Button(action: {
            
            self.sheetPresent = true
            
        }){
            Text("home")
        }.sheet(isPresented: $sheetPresent){
            FirstDestination()
        }
    }
}

struct FirstDestination: View {
    var body: some View {
        NavigationView{
            NavigationLink(destination: SecondDestination()) {
                Text("welcome to the second place")
            }
        }.navigationBarTitle("sheet")
    }
}

struct SecondDestination: View {
    var body: some View {
        Text("welcome to the second place")
    }
}

struct ScreenTest_Previews: PreviewProvider {
    static var previews: some View{
        
        ScreenTest()
    }
}
