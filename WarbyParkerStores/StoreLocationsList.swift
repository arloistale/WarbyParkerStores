//
//  StoreLocationsList.swift
//  WarbyParkerStores
//
//  Created by Jonathan Lu on 10/13/20.
//

import SwiftUI

struct StoreLocationsList: View {
    static let fadeDuration: Double = 0.1
    
    @ObservedObject var viewModel: StoreLocationsViewModel
    
    var action: (StoreLocation) -> Void
    
    @State private var isShowing = false
    
    var body: some View {
        // show a list of store locations, and go into the
        // detail once a location is clicked
        ZStack {
            if isShowing {
                ZStack {
                    VStack {
                        Spacer()
                            .frame(height: 50)
                        
                        ScrollView() {
                            LazyVStack {
                                ForEach(viewModel.data.locations) { location in
                                    StoreLocationRow(location: location) {
                                        self.action(location)
                                    }
                                }
                            }
                        }
                    }
                    
                    if viewModel.isLoading {
                        ProgressView()
                    }
                }
                .transition(.opacity)
            }
        }
        .onReceive(viewModel.$shouldShowList) { value in
            // animate the detail in from the bottom edge
            withAnimation(Animation.easeInOut(duration: Self.fadeDuration).delay(viewModel.listTransitionDelay)) {
                self.isShowing = value
            }
        }
    }
}
