//
//  AppView.swift
//  WarbyParkerStores
//
//  Created by Jonathan Lu on 10/11/20.
//

import SwiftUI

struct AppView: View {
    var storeLocationsViewModel = StoreLocationsViewModel(repository: StoreLocationsRepositoryImpl())
    
    var body: some View {
        StoreLocationsView(viewModel: storeLocationsViewModel)
            .tabItem {
                Image(systemName: "list.dash")
                Text("Menu")
            }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
