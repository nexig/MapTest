//
//  GetStoresRequest.swift
//  Maptest
//
//  Created by Jakub Żurek on 18/12/2021.
//

import Foundation
import Alamofire

class GetStoresRequest: NetworkRequest {
    
    let lat: String
    let lon: String
    
    public var path: String {
        return "/stores/?longitude=\(lon)&latitude=\(lat)&radius=1000&page=1&pageSize=10&clientApplicationKey=testApplication"
    }
    
    public var httpMethod: HTTPMethod {
        return .get
    }
    
    public var headers: HTTPHeaders? {
        return [:]
    }
    
    public var parameters: Parameters? {
        return nil
    }
    
    public var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    public var jsonData: Data? {
        return nil
    }
    
    init(lat: String, lon: String) {
        self.lat = lat
        self.lon = lon
    }
}

