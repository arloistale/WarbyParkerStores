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
    
    @Published var shouldShowList = false
    @Published var listTransitionDelay: Double = 0
    
    @Published var shouldShowDetail = false
    @Published var detailTransitionDelay: Double = 0
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
    
    func showList(delay: Double = 0) {
        listTransitionDelay = delay
        shouldShowList = true
    }
    
    func hideList(delay: Double = 0) {
        listTransitionDelay = delay
        shouldShowList = false
    }
    
    func showDetail(location: StoreLocation, delay: Double = 0) {
        detailTransitionDelay = delay
        locationForDetail = location
        shouldShowDetail = true
    }
    
    func hideDetail(delay: Double = 0) {
        detailTransitionDelay = delay
        shouldShowDetail = false
    }
}
