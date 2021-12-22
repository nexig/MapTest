//
//  StoreDetailsViewModel.swift
//  Maptest
//
//  Created by Jakub Żurek on 22/12/2021.
//

import Foundation
import SwiftUI

class StoreDetailsViewModel: ObservableObject {
    
    @Published var store: StoreDTO
    
    init(store: StoreDTO) {
        self.store = store
    }
    
}
