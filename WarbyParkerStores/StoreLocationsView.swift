//
//  StoreLocationsView.swift
//  WarbyParkerStores
//
//  Created by Jonathan Lu on 10/10/20.
//

import SwiftUI
import Combine

struct StoreLocationsView: View {
    static let listFadeDuration: Double = 0.1
    
    @ObservedObject var viewModel: StoreLocationsViewModel
    
    // used to animate list in and out
    @State private var listOffsetY: CGFloat = -1500
    @State private var listOpacity: Double = 1
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 50)
            
            ZStack {
                // show a list of store locations, and go into the
                // detail once a location is clicked
                ScrollView() {
                    LazyVStack {
                        ForEach(viewModel.data.locations) { location in
                            StoreLocationRow(location: location) {
                                viewModel.setLocationForDetail(location: location)
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + StoreLocationsView.listFadeDuration + StoreLocationRow.maskFillDuration) {
                                    viewModel.showDetail()
                                }
                                
                                // when a list row is clicked, wait for the mask anim then fade the entire list out
                                return withAnimation(Animation.easeInOut(duration: StoreLocationsView.listFadeDuration).delay(StoreLocationRow.maskFillDuration)) {
                                    self.listOpacity = 0
                                }
                            }
                        }
                    }
                }
                .opacity(listOpacity)
                .offset(x: 0, y: listOffsetY)

                if viewModel.isLoading {
                    ProgressView()
                }
                
                // show the detail view once a store location is clicked
                if viewModel.shouldShowDetail {
                    StoreLocationDetail(location: viewModel.locationForDetail!) {
                        viewModel.hideDetail()
                        
                        // when the detail view is exited, fade the list back in
                        return withAnimation(Animation.easeInOut(duration: StoreLocationsView.listFadeDuration)) {
                            self.listOpacity = 1
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.load()
            
            // animate the list content in
            return withAnimation(.spring(response: 0.33, dampingFraction: 0.73, blendDuration: 100)) {
                self.listOffsetY = 0
            }
        }
    }
}
