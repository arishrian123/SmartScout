//
//  SettingsView.swift
//  
//
//  Created by Oliver Cordingley on 14/09/2020.
//

import SwiftUI

struct SettingsView: View {
    
    let settings = Bundle.main.decode([MenuSection].self,
        from: "Settings.json")
  
    var body: some View {
        NavigationView {
            List {
                ForEach(settings) { section in
                    Section(header: Text(section.name)) {
                    
                    ForEach(section.item) { item in
                        ItemRow(item: item)
                    }
                    }
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
