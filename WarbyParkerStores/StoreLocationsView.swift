//
//  StoreLocationsView.swift
//  WarbyParkerStores
//
//  Created by Jonathan Lu on 10/10/20.
//

import SwiftUI
import class Kingfisher.ImageCache
import Combine

struct StoreLocationsView: View {
    @ObservedObject var viewModel: StoreLocationsViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.data.locations) { location in
                            StoreLocationRow(location: location)
                        }
                    }
                }
                
                if viewModel.isLoading {
                    ProgressView()
                }
            }
            .navigationBarTitle("Warby Parker Stores")
            .onAppear {
                viewModel.load()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let mockData = StoreLocationsData(locations: [StoreLocation.example, StoreLocation.example, StoreLocation.example])
    
    static var previews: some View {
        StoreLocationsView(viewModel: StoreLocationsViewModel(repository:  StoreLocationsRepositoryMock(mockPublisher: Just(mockData).setFailureType(to: Error.self).eraseToAnyPublisher())))
    }
}
