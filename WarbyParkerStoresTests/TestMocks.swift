import Combine

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
