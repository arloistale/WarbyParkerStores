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
    var offersEyeExams: Bool
    var cmsContent: CmsContent
    
    #if DEBUG
    static let example = StoreLocation(name: "Blockbuster", address: Address(streetAddress: "500 America Street", locality: "Freedom", regionCode: "TX", postalCode: "10000"), offersEyeExams: true, cmsContent: CmsContent(cardPhoto: "dunno", description: "Not a lot", heroImage: []))
    #endif
}

struct Address: Codable {
    var streetAddress: String
    var locality: String
    var regionCode: String
    var postalCode: String
}

struct CmsContent: Codable {
    var cardPhoto: String
    var description: String
    var heroImage: [ImageInfo]
    
    var smallHeroImage: String {
        heroImage.first(where: {$0.size == "small"})?.image ?? ""
    }
}

struct ImageInfo: Codable {
    var image: String?
    var size: String?
}
