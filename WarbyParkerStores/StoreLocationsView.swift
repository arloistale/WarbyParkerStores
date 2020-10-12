//
//  StoreLocationsView.swift
//  WarbyParkerStores
//
//  Created by Jonathan Lu on 10/10/20.
//

import SwiftUI

struct StoreLocationsView: View {
    @ObservedObject var viewModel: StoreLocationsViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.data.locations) { location in
                    StoreLocationRow(location: location)
                }
            }
            .navigationBarTitle("Menu")
            .listStyle(GroupedListStyle())
            .onAppear {
                viewModel.load()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StoreLocationsView(viewModel: StoreLocationsViewModel(repository:  StoreLocationsRepositoryMock()))
    }
}
