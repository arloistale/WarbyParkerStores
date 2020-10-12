//
//  StoreLocationsRepository.swift
//  WarbyParkerStores
//
//  Created by Jonathan Lu on 10/11/20.
//

import Foundation
import Combine

protocol StoreLocationsRepository {
    func fetchData() -> AnyPublisher<StoreLocationsData, Error>
}

class StoreLocationsRepositoryImpl: StoreLocationsRepository {
    let apiUrl = "https://www.warbyparker.com/api/v2/retail/locations"
    
    func fetchData() -> AnyPublisher<StoreLocationsData, Error> {
        guard let url = URL(string: apiUrl) else {
            preconditionFailure("Invalid Url")
        }
        
        let urlRequest = URLRequest(url: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .decode(type: StoreLocationsData.self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

#if DEBUG
class StoreLocationsRepositoryMock: StoreLocationsRepository {
    let mockPublisher: AnyPublisher<StoreLocationsData, Error>
    
    convenience init() {
        let mockPublisher = Just(StoreLocationsData(locations: []))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
        
        self.init(mockPublisher: mockPublisher)
    }
    
    init(mockPublisher: AnyPublisher<StoreLocationsData, Error>) {
        self.mockPublisher = mockPublisher
    }
    
    func fetchData() -> AnyPublisher<StoreLocationsData, Error> {
        mockPublisher
    }
}
#endif
