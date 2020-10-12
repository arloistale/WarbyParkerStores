//
//  StoreLocationsRepository.swift
//  WarbyParkerStores
//
//  Created by Jonathan Lu on 10/11/20.
//

import Foundation

protocol StoreLocationsRepository {
    func fetchData(completion: @escaping (StoreLocationsData) -> Void)
}

class StoreLocationsRepositoryImpl: StoreLocationsRepository {
    func fetchData(completion: @escaping (StoreLocationsData) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let data = Bundle.main.decode(StoreLocationsData.self, from: "TestData.json")
            completion(data)
        }
    }
}

#if DEBUG
class StoreLocationsRepositoryMock: StoreLocationsRepository {
    let mockData: StoreLocationsData
    
    convenience init() {
        self.init(mockData: StoreLocationsData(locations: []))
    }
    
    init(mockData: StoreLocationsData) {
        self.mockData = mockData
    }
    
    func fetchData(completion: @escaping (StoreLocationsData) -> Void) {
        completion(mockData)
    }
}
#endif
