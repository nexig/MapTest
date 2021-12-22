//
//  ParseHelper.swift
//  MaptestDev
//
//  Created by Jakub Żurek on 22/12/2021.
//

import Foundation

class ParseHelper: NSObject, XMLParserDelegate {
    
    var stores: [StoreDTO] = []
    var currentParsingElement: StoreDTO?
    var element: String?
    
    func parseStores(data: Data) -> [StoreDTO] {
        stores = []
        let parser = XMLParser(data: data)
        parser.delegate = self
        parser.parse()
        return stores
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        if elementName == "store" {
            currentParsingElement = StoreDTO()
        }
        element = elementName
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "store" {
            if let currentParsingElement = currentParsingElement {
                stores.append(currentParsingElement)
            }
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        guard let element = element else {
            return
        }
        switch element {
        case "posId": currentParsingElement?.posId = string
        case "name": currentParsingElement?.name = string
        case "address": currentParsingElement?.address = string
        case "latitude": currentParsingElement?.latitude = string
        case "longitude": currentParsingElement?.longitude = string
        case "postalCode": currentParsingElement?.postalCode = string
        case "city": currentParsingElement?.city = string
        case "distributorId": currentParsingElement?.distributorId = string
        case "country": currentParsingElement?.country = string
        case "productLogo": currentParsingElement?.productLogo = string
        case "specialText": currentParsingElement?.specialText = string
        case "posTypeLogo": currentParsingElement?.posTypeLogo = string
        default: break
        }
    }
    
}
