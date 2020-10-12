//
//  StoreLocationsModelsTests.swift
//  WarbyParkerStoresTests
//
//  Created by Jonathan Lu on 10/12/20.
//

import XCTest

class StoreLocationsModelsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCmsContentEmptySmallHero() throws {
        let cmsContent = CmsContent(cardPhoto: "", description: "", heroImage: [])
        XCTAssert(cmsContent.smallHeroImage == "")
    }
    
    func testCmsContentSmallHeroSuccess() throws {
        let cmsContent = CmsContent(cardPhoto: "", description: "", heroImage: [ImageInfo(image: "Chuck", size: "large"), ImageInfo(image: "Brad", size: "small")])
        XCTAssert(cmsContent.smallHeroImage == "Brad")
    }
    
    func testCmsContentSmallHeroNonexistent() throws {
        let cmsContent = CmsContent(cardPhoto: "", description: "", heroImage: [ImageInfo(image: "Chuck", size: "large"), ImageInfo(image: "Brad", size: "smol")])
        XCTAssert(cmsContent.smallHeroImage == "")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
