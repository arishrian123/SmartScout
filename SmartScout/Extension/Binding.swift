//
//  Binding.swift
//  Recruit Room
//
//  Created by Arish Tripathi on 22/08/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

public extension Binding where Value: CaseIterable & Equatable {
  var caseIndex: Binding<Value.AllCases.Index> {
    Binding<Value.AllCases.Index>(
      get: { Value.allCases.firstIndex(of: self.wrappedValue)! },
      set: { self.wrappedValue = Value.allCases[$0] }
    )
  }
}

