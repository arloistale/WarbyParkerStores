//
//  StoreLocationsViewModelTests.swift
//  WarbyParkerStoresTests
//
//  Created by Jonathan Lu on 10/11/20.
//

import XCTest
import Combine

class StoreLocationsViewModelTests: XCTestCase {
    
    func testLoadEmpty() throws {
        let viewModel = StoreLocationsViewModel(repository: StoreLocationsRepositoryMock())
        
        viewModel.load()
        
        XCTAssert(!viewModel.isLoading)
        XCTAssert(viewModel.data.locations.count == 0)
    }
    
    func testLoadFailure() throws {
        let repository = StoreLocationsRepositoryMock(mockPublisher: Fail(error: URLError(.badURL, userInfo: [NSURLErrorKey: ""])).eraseToAnyPublisher())
        let viewModel = StoreLocationsViewModel(repository: repository)
        
        viewModel.load()
        
        XCTAssert(!viewModel.isLoading)
        XCTAssert(viewModel.data.locations.count == 0)
    }

    func testLoadSuccess() throws {
        let repository = StoreLocationsRepositoryMock(mockPublisher: Just(StoreLocationsData(locations: [StoreLocation.example])).setFailureType(to: Error.self).eraseToAnyPublisher())
        let viewModel = StoreLocationsViewModel(repository: repository)
        
        viewModel.load()
        
        XCTAssert(!viewModel.isLoading)
        XCTAssert(viewModel.data.locations.count == 1)
    }
    
    func testLoadStalling() throws {
        let repository = StoreLocationsRepositoryMock(mockPublisher: Empty(completeImmediately: false).setFailureType(to: Error.self).eraseToAnyPublisher())
        let viewModel = StoreLocationsViewModel(repository: repository)
        
        viewModel.load()
        
        XCTAssert(viewModel.isLoading)
        XCTAssert(viewModel.data.locations.count == 0)
    }
    
    func testShowDetailFailure() throws {
        let viewModel = StoreLocationsViewModel(repository: StoreLocationsRepositoryMock())
        
        XCTAssert(viewModel.locationForDetail == nil)
        
        // cannot show if detail location has not been set
        viewModel.showDetail()
        
        XCTAssert(!viewModel.shouldShowDetail)
    }
    
    func testShowDetailSuccess() throws {
        let viewModel = StoreLocationsViewModel(repository: StoreLocationsRepositoryMock())
        
        // need to first set the location before we show
        viewModel.setLocationForDetail(location: StoreLocation.example)

        XCTAssert(viewModel.locationForDetail!.id == StoreLocation.example.id)
        
        viewModel.showDetail()
        
        XCTAssert(viewModel.shouldShowDetail)
        
        viewModel.hideDetail()
        
        XCTAssert(!viewModel.shouldShowDetail)
    }
}
