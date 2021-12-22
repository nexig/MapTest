//
//  NetworkService.swift
//  Maptest
//
//  Created by Jakub Żurek on 16/12/2021.
//

import Foundation
import Alamofire

class NetworkService: NSObject, NetworkServiceType {
    
    public var session: Session
    public var configuration: ServiceConfig
    
    public required init?(_ configuration: ServiceConfig? = ServiceConfig()) {
        guard let configuration = configuration else {
            return nil
        }
        self.configuration = configuration
        
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        config.urlCache = nil

        
        self.session = Session(configuration: config)
        super.init()
    }
}

public protocol NetworkServiceType {
    
    var configuration: ServiceConfig { get }
    var session: Session { get }
    
}

extension NetworkServiceType {
    
    public func execute<T: Codable>(request: NetworkRequest, completion: @escaping (NetworkResponse<T>?, NetworkError?) -> Void) {
        let headers = mergeHeaders(requestHeaders: request.headers)
        session.request(request.url(for: configuration), method: request.httpMethod, parameters: request.parameters, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .response { response in
                if response.error == nil {
                    if let data = response.data {
                        do {
                            let object = try NetworkResponse<T>(response: response, data: data)
                            completion(object, nil)
                        } catch let error {
                            print("\(error.localizedDescription)")
                            if let afError = error.asAFError {
                                completion(nil, NetworkError(error: afError))
                            } else {
                                completion(nil, nil)
                            }
                        }
                    }
                } else {
                    if let afError = response.error?.asAFError {
                        completion(nil, NetworkError(error: afError))
                    }
                }
            }
    }
    
    private func mergeHeaders(requestHeaders: HTTPHeaders?) -> HTTPHeaders {
        var headers: HTTPHeaders = []
        for (key, value) in configuration.defaultHeaders.dictionary {
            headers.add(name: key, value: value)
        }
        if let requestHeadersDict = requestHeaders?.dictionary {
            for (key, value) in requestHeadersDict {
                headers.add(name: key, value: value)
            }
        }
        return headers
    }
}
