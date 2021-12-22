//
//  NetworkError.swift
//  Maptest
//
//  Created by Jakub Żurek on 16/12/2021.
//

import Foundation
import Alamofire

public struct NetworkError: Error {
    
    public var message: String?
    public var code: Int?
    public var domain: URL?
    public var error: NSError?
    
    init() {
        
    }
    
    init(error: AFError) {
        message = error.localizedDescription
        code = error.responseCode
        domain = error.url
        self.error =  (error as NSError)
    }
}
