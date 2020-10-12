//
//  StoreLocationsViewModel.swift
//  WarbyParkerStores
//
//  Created by Jonathan Lu on 10/11/20.
//

import Foundation

class StoreLocationsViewModel: ObservableObject {
    let repository: StoreLocationsRepository
    
    @Published var data = StoreLocationsData(locations: [])
    @Published var isLoading = false
    
    init(repository: StoreLocationsRepository) {
        self.repository = repository
    }
    
    func load() {
        isLoading = true
        repository.fetchData { data in
            self.isLoading = false
            self.data = data
        }
    }
}
