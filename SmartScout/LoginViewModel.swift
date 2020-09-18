//
//  LoginViewModel.swift
//  SmartScout
//
//  Created by Arish Tripathi on 17/09/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var isLoggedIn: Bool = UserDefaults.standard.bool(forKey: "isLoggedIn"){
        didSet {
            UserDefaults.standard.set(self.isLoggedIn, forKey: "isLoggedIn")
        }
    }
}
