//
//  WarbyParkerStoresApp.swift
//  WarbyParkerStores
//
//  Created by Jonathan Lu on 10/10/20.
//

import SwiftUI

@main
struct WarbyParkerStoresApp: App {
    let storeLocationsViewModel = StoreLocationsViewModel(repository: StoreLocationsRepositoryImpl())
    
    var body: some Scene {
        WindowGroup {
            StoreLocationsView(viewModel: storeLocationsViewModel)
        }
    }
}
