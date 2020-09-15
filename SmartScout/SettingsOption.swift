//
//  SettingOption.swift
//  Settings_for_SS
//
//  Created by Ollie Cordingley on 30/08/2020.
//  Copyright © 2020 Ollie Cordingley. All rights reserved.
//
import Foundation
import SwiftUI


enum Categories {
    
    case Communication
    case OurApp
    case Community
    case Legal
}
class Settings {
    
    let title: String
    let imageName: Image
    let clr: Color
    let category: Categories
    let id: Int
    
    init(title: String, imageName: Image, clr: Color, category: Categories, id: Int) {
        self.title = title
        self.imageName = imageName
        self.clr = clr
        self.category = category
        self.id = id
        
    }
}
