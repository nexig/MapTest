//
//  ServiceConfig.swift
//  Maptest
//
//  Created by Jakub Żurek on 16/12/2021.
//

import Foundation
import Alamofire

public final class ServiceConfig {
    
    private(set) var url: URL
    private(set) var defaultHeaders: HTTPHeaders
    
    public convenience init?() {
        let baseUrlString = API.baseURL
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        self.init(base: baseUrlString, defaultHeaders: headers)
    }
    
    public init?(base urlString: String, defaultHeaders: HTTPHeaders = [:]) {
        guard let url = URL(string: urlString) else { return nil }
        self.url = url
        self.defaultHeaders = defaultHeaders
    }
    
    public static func configuration() -> ServiceConfig? {
        return ServiceConfig()
    }
    
    public var description: String {
        return "\(self.url.absoluteString)"
    }
}
