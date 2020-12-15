//
//  StoreLocationsModelsTests.swift
//  WarbyParkerStoresTests
//
//  Created by Jonathan Lu on 10/12/20.
//

import XCTest

class StoreLocationsModelsTests: XCTestCase {

    func testCmsContentEmptySmallHero() throws {
        let cmsContent = CmsContent(cardPhoto: "", description: "", heroImage: [])
        XCTAssert(cmsContent.smallHeroImage == "")
    }
    
    func testCmsContentSmallHeroNonexistent() throws {
        let cmsContent = CmsContent(cardPhoto: "", description: "", heroImage: [ImageInfo(image: "Chuck", size: "large"), ImageInfo(image: "Brad", size: "smol")])
        XCTAssert(cmsContent.smallHeroImage == "")
    }
    
    func testCmsContentSmallHeroSuccess() throws {
        let cmsContent = CmsContent(cardPhoto: "", description: "", heroImage: [ImageInfo(image: "Chuck", size: "large"), ImageInfo(image: "Brad", size: "small")])
        XCTAssert(cmsContent.smallHeroImage == "Brad")
    }
}
