//
//  NetworkResponse.swift
//  Maptest
//
//  Created by Jakub Żurek on 16/12/2021.
//

import Foundation
import Alamofire

public class NetworkResponse<ResponseType: Codable> {
    
    public let url: String?
    public var statusCode: Int?
    public let content: ResponseType
    
    public init(response: AFDataResponse<Data?>, data: Data) throws {
        url = response.request?.url?.absoluteString
        statusCode = response.response?.statusCode
        content = ParseHelper().parseStores(data: data) as! ResponseType
    }
}
