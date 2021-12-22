//
//  NetworkRequest.swift
//  Maptest
//
//  Created by Jakub Żurek on 16/12/2021.
//

import Foundation
import Alamofire

public protocol NetworkRequest: Encodable {
    var path: String { get }
    
    var httpMethod: HTTPMethod { get }
    
    var headers: HTTPHeaders? { get }
    
    var parameters: Parameters? { get }
    
    var encoding: ParameterEncoding { get }
    
    var jsonData: Data? { get }
}

public extension NetworkRequest {
    func url(for configuration: ServiceConfig) -> String {
        let url = configuration.url.absoluteString + path
        return url
    }
}

