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
    
    @State private var isShowing = false
    
    var body: some View {
        ZStack {
            if isShowing {
                ZStack {
                    StoreLocationsList(viewModel: viewModel) { location in
                        viewModel.hideList(delay: StoreLocationRow.maskFillDuration)

                        viewModel.showDetail(location: location, delay: StoreLocationRow.maskFillDuration + Self.listFadeDuration)
                    }
                    
                    // show the detail view once a store location is clicked
                    StoreLocationDetail(viewModel: viewModel) {
                        viewModel.hideDetail()
                        viewModel.showList(delay: 0.5)
                    }
                }
                .transition(.slide)
            }
        }
        .onAppear {
            viewModel.load()
            viewModel.showList()
            
            return withAnimation(.spring()) {
                self.isShowing = true;
            }
        }
    }
}
