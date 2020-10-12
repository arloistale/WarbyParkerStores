//
//  StoreLocationsModels.swift
//  WarbyParkerStores
//
//  Created by Jonathan Lu on 10/10/20.
//

import Foundation

struct StoreLocationsData: Codable {
    var locations: [StoreLocation]
}

struct StoreLocation: Codable, Identifiable {
    let id = UUID()
    var name: String
    var address: Address
    
    #if DEBUG
    static let example = StoreLocation(name: "Blockbuster", address: Address(streetAddress: "500 America Street", locality: "Freedom", regionCode: "TX", postalCode: "10000"))
    #endif
}

struct Address: Codable {
    var streetAddress: String
    var locality: String
    var regionCode: String
    var postalCode: String
    
    enum CodingKeys: String, CodingKey {
            case streetAddress = "street_address"
            case locality
            case regionCode = "region_code"
            case postalCode = "postal_code"
        }
}
