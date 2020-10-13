//
//  StoreLocationsViewModel.swift
//  WarbyParkerStores
//
//  Created by Jonathan Lu on 10/11/20.
//

import Foundation
import Combine

class StoreLocationsViewModel: ObservableObject {
    let repository: StoreLocationsRepository
    
    @Published var data = StoreLocationsData(locations: [])
    @Published var isLoading = false
    
    @Published var shouldShowDetail = false
    @Published var locationForDetail: StoreLocation?
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(repository: StoreLocationsRepository) {
        self.repository = repository
    }
    
    func load() {
        isLoading = true
        
        repository.fetchData()
            .sink(receiveCompletion: { completion in
                self.isLoading = false

                switch completion {
                case let .failure(error):
                    print("Couldn't get store locations: \(error)")
                case .finished:
                    print("Finished getting store locations!")
                }
            }, receiveValue: { data in
                self.data = data
            })
            .store(in: &subscriptions)
    }
    
    func showDetail() {
        guard locationForDetail != nil else {
            print("Cannot show detail until location has been set")
            return
        }
        
        shouldShowDetail = true
    }
    
    func hideDetail() {
        shouldShowDetail = false
    }
    
    func setLocationForDetail(location: StoreLocation) {
        locationForDetail = location
    }
}
