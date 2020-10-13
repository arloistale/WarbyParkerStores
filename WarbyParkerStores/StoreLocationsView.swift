//
//  StoreLocationsView.swift
//  WarbyParkerStores
//
//  Created by Jonathan Lu on 10/10/20.
//

import SwiftUI
import Combine

struct StoreLocationsView: View {
    @ObservedObject var viewModel: StoreLocationsViewModel
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 50)
            
            ZStack {
                if viewModel.shouldShowList {
                    StoreLocationsList(viewModel: viewModel) { location in
                        viewModel.hideList(delay: StoreLocationRow.maskFillDuration)
                        
                        viewModel.showDetail(location: location, delay: StoreLocationRow.maskFillDuration + StoreLocationsList.listFadeDuration)
                    }
                }

                if viewModel.isLoading {
                    ProgressView()
                }
                
                // show the detail view once a store location is clicked
                if viewModel.shouldShowDetail {
                    StoreLocationDetail(viewModel: viewModel, location: viewModel.locationForDetail!) {
                        viewModel.hideDetail()
                    }
                }
            }
        }
        .onAppear {
            viewModel.load()
            viewModel.showList()
        }
    }
}
