//
//  StoreLocationsView.swift
//  WarbyParkerStores
//
//  Created by Jonathan Lu on 10/10/20.
//

import SwiftUI
import Combine

struct StoreLocationsView: View {
    let topSpacerHeight: CGFloat = 50
    
    let fadeDuration: Double = 0.1
    let maskFillDuration: Double = 1
    
    @ObservedObject var viewModel: StoreLocationsViewModel
    
    @State private var contentOffset: CGFloat = -1500
    @State private var contentOpacity: Double = 1
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: topSpacerHeight)
            
            ZStack {
                ScrollView() {
                    LazyVStack {
                        ForEach(viewModel.data.locations) { location in
                            StoreLocationRow(location: location) {
                                viewModel.setLocationForDetail(location: location)
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + fadeDuration + maskFillDuration) {
                                    viewModel.showDetail()
                                }
                                
                                return withAnimation(Animation.easeInOut(duration: fadeDuration).delay(maskFillDuration)) {
                                    self.contentOpacity = 0
                                }
                            }
                        }
                    }
                }
                .opacity(contentOpacity)
                .offset(x: 0, y: contentOffset)

                if viewModel.isLoading {
                    ProgressView()
                }
                
                // the detail view opens once the button is clicked
                // and the mask fill has completed
                if viewModel.shouldShowDetail {
                    StoreLocationDetail(location: viewModel.locationForDetail!) {
                        viewModel.hideDetail()
                        
                        return withAnimation(Animation.easeInOut(duration: fadeDuration)) {
                            self.contentOpacity = 1
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.load()
            
            return withAnimation(.spring(response: 0.33, dampingFraction: 0.73, blendDuration: 100)) {
                self.contentOffset = 0
            }
        }
    }
}

struct StoreLocationsView_Previews: PreviewProvider {
    static let mockData = StoreLocationsData(locations: [StoreLocation.example, StoreLocation.example, StoreLocation.example])
    
    static let mockViewModel = StoreLocationsViewModel(repository:  StoreLocationsRepositoryMock(mockPublisher: Just(mockData).setFailureType(to: Error.self).eraseToAnyPublisher()))
    
    static var previews: some View {
        StoreLocationsView(viewModel: mockViewModel)
    }
}
