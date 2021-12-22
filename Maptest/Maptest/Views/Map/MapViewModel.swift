//
//  MapViewModel.swift
//  Maptest
//
//  Created by Jakub Żurek on 17/12/2021.
//

import Foundation
import SwiftUI
import CoreLocation
import MapKit

class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var pins : [Pin] = []
    @Published var location: CLLocation?
    @State var hasSetRegion = false
    
    @Published var region = MKCoordinateRegion()
    
    let mapService: MapServiceProtocol
    
    init(mapService: MapServiceProtocol) {
        self.mapService = mapService
    }
    
    func getStores(location: CLLocationCoordinate2D) {
        mapService.getStores(lat: "\(Double(location.latitude))", lon: "\(Double(location.longitude))") { [weak self] response, error in
            self?.pins.removeAll()
            if let stores = response?.content, let pins = self?.makePins(from: stores) {
                self?.pins = pins
            }
        }
    }
    
    func makePins(from stores: [StoreDTO]) -> [Pin] {
        var pins: [Pin] = []
        for store in stores {
            let pin = Pin(store: store)
            pins.append(pin)
        }
        return pins
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse{
            manager.startUpdatingLocation()
        } else {
            manager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            self.location = location
            if hasSetRegion == false {
                region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001))
                getStores(location: location.coordinate)
                hasSetRegion = true
            }
        }
    }
}
