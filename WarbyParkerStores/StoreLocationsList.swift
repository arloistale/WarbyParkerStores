//
//  StoreLocationsList.swift
//  WarbyParkerStores
//
//  Created by Jonathan Lu on 10/13/20.
//

import SwiftUI

struct StoreLocationsList: View {
    static let listFadeDuration: Double = 0.1
    
    @ObservedObject var viewModel: StoreLocationsViewModel
    
    var action: (StoreLocation) -> Void
    
    // used to animate list in and out
    @State private var listOpacity: Double = 1
    
    var body: some View {
        // show a list of store locations, and go into the
        // detail once a location is clicked
        ScrollView() {
            LazyVStack {
                ForEach(viewModel.data.locations) { location in
                    StoreLocationRow(location: location) {
                        self.action(location)
                    }
                }
            }
        }
        .opacity(listOpacity)
        .onAppear {
            withAnimation(Animation.easeInOut(duration: StoreLocationsList.listFadeDuration)) {
                self.listOpacity = 1
            }
        }
        .onDisappear {
            withAnimation(Animation.easeInOut(duration: StoreLocationsList.listFadeDuration).delay(viewModel.listTransitionDelay)) {
                self.listOpacity = 0
            }
        }
    }
}
