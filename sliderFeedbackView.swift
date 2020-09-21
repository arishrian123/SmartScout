//
//  sliderFeedbackView.swift
//  SmartScout
//
//  Created by Oliver Cordingley on 21/09/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

struct sliderFeedbackView: View {
    
    
    @State var userFeedback = 0.0
    
    var body: some View {
        
        
        VStack{
            
            Text("Please give us feedback!")
              .font(Font.custom("Poppins-Light", size: 15))

       HStack{
                      
                      Image(systemName: "hand.thumbsdown")
                          .resizable()
                          .frame(width: 20, height: 20)
                  Section{
                      Slider(value: $userFeedback, in: 0.0...10.0)
                  }
                      Image(systemName: "hand.thumbsup")
                      .resizable()
                      .frame(width: 20, height: 20)
        Spacer(minLength: 100)
       }.offset(x:50)
    }
}
}
struct sliderFeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        sliderFeedbackView()
    }
}
