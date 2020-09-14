//
//  DispatchQueue.swift
//  SmartScout
//
//  Created by Arish Tripathi on 14/09/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import Foundation
import SwiftUI

extension DispatchQueue {

    static func background(delay: Double = 0.0, background: (()->Void)? = nil, completion: (() -> Void)? = nil) {
        DispatchQueue.global(qos: .background).async {
            background?()
            if let completion = completion {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                    completion()
                })
            }
        }
    }

}
