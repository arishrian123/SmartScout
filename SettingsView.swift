//
//  SettingsView.swift
//  
//
//  Created by Oliver Cordingley on 15/09/2020.
//

import SwiftUI

struct SettingsView: View {
    
    let settings = Bundle.main.decode([MenuSection].self,
        from: "Settings.json")
    
    var body: some View {

        NavigationView() {
            List {
                ForEach(settings) { section in
                    Section(header: Text(section.name)) {
                    
                    ForEach(section.item) { item in
                        NavigationLink(destination: SettingsDetailView(item: item)){
                        ItemRow(item: item)
                        }
                    }
                    }.font(Font.custom("Poppins-Light", size: 16))
                }
            }
            .navigationBarTitle("Settings")
        .listStyle(GroupedListStyle())
            
    }
}
}

    struct Settingsview_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView()
        }
}
