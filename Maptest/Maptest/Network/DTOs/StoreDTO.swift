//
//  StoreDTO.swift
//  Maptest
//
//  Created by Jakub Żurek on 18/12/2021.
//

import Foundation

struct StoreDTO: Codable {
    var posId: String?
    var name: String?
    var address: String?
    var latitude: String?
    var longitude: String?
    var postalCode: String?
    var city: String?
    var distributorId: String?
    var country: String?
    var productLogo: String?
    var specialText: String?
    var posTypeLogo: String?
}
