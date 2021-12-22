//
//  ViewModelFactory.swift
//  Maptest
//
//  Created by Jakub Żurek on 17/12/2021.
//

import Foundation

protocol ViewModelFactory {
    
    func makeMapViewModel() -> MapViewModel
    func makeStoreDetailsViewModel(store: StoreDTO) -> StoreDetailsViewModel
    
}
