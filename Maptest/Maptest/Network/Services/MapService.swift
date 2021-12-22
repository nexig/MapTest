//
//  MapService.swift
//  Maptest
//
//  Created by Jakub Żurek on 17/12/2021.
//

import Foundation

protocol MapServiceProtocol {
    
    func getStores(lat: String, lon: String, completion: @escaping (NetworkResponse<[StoreDTO]>?, Error?) -> Void)
        
}

class MapService: NetworkService, MapServiceProtocol {

    func getStores(lat: String, lon: String, completion: @escaping (NetworkResponse<[StoreDTO]>?, Error?) -> Void) {
        let request = GetStoresRequest(lat: lat, lon: lon)
        execute(request: request) { response, error in
            completion(response, error)
        }
    }
    
}
