//
//  StoreLocationsViewModelTests.swift
//  WarbyParkerStoresTests
//
//  Created by Jonathan Lu on 10/11/20.
//

import XCTest
import Combine

class StoreLocationsViewModelTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testEmpty() throws {
        let viewModel = StoreLocationsViewModel(repository: StoreLocationsRepositoryMock())
        
        viewModel.load()
        
        XCTAssert(!viewModel.isLoading)
        XCTAssert(viewModel.data.locations.count == 0)
    }
    
    func testFailure() throws {
        let repository = StoreLocationsRepositoryMock(mockPublisher: Fail(error: URLError(.badURL, userInfo: [NSURLErrorKey: ""])).eraseToAnyPublisher())
        let viewModel = StoreLocationsViewModel(repository: repository)
        
        viewModel.load()
        
        XCTAssert(!viewModel.isLoading)
        XCTAssert(viewModel.data.locations.count == 0)
    }

    func testSuccess() throws {
        let repository = StoreLocationsRepositoryMock(mockPublisher: Just(StoreLocationsData(locations: [StoreLocation.example])).setFailureType(to: Error.self).eraseToAnyPublisher())
        let viewModel = StoreLocationsViewModel(repository: repository)
        
        viewModel.load()
        
        XCTAssert(!viewModel.isLoading)
        XCTAssert(viewModel.data.locations.count == 1)
    }
    
    func testStalling() throws {
        let repository = StoreLocationsRepositoryMock(mockPublisher: Empty(completeImmediately: false).setFailureType(to: Error.self).eraseToAnyPublisher())
        let viewModel = StoreLocationsViewModel(repository: repository)
        
        viewModel.load()
        
        XCTAssert(viewModel.isLoading)
        XCTAssert(viewModel.data.locations.count == 0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
