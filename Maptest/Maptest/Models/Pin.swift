//
//  Pin.swift
//  Maptest
//
//  Created by Jakub Żurek on 22/12/2021.
//

import CoreLocation

struct Pin : Identifiable {
    var id = UUID().uuidString
    var location : CLLocation = CLLocation()
    var store: StoreDTO
    init(store: StoreDTO) {
        self.store = store
        if let lat = Double(store.latitude ?? ""), let lon = Double(store.longitude ?? "") {
            location = CLLocation(latitude: lat, longitude: lon)
        }
    }
}
