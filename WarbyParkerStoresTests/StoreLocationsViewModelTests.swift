//
//  StoreLocationsViewModelTests.swift
//  WarbyParkerStoresTests
//
//  Created by Jonathan Lu on 10/11/20.
//

import XCTest
import Combine

class StoreLocationsViewModelTests: XCTestCase {
    
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
    
    func testSelecting() throws {
        let viewModel = StoreLocationsViewModel(repository: StoreLocationsRepositoryMock())
        
        viewModel.selectLocation(location: StoreLocation.example)
        
        XCTAssert(viewModel.selectedLocation!.id == StoreLocation.example.id)
    }

}
