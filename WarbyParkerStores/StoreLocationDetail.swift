//
//  StoreLocationDetail.swift
//  WarbyParkerStores
//
//  Created by Jonathan Lu on 10/10/20.
//

import SwiftUI
import KingfisherSwiftUI

struct StoreLocationDetail: View {
    
    @ObservedObject var viewModel: StoreLocationsViewModel
    
    var action: () -> Void
    
    var location: StoreLocation? {
        viewModel.locationForDetail
    }
    
    @State private var isShowing = false
    
    var body: some View {
        ZStack {
            if self.isShowing {
                VStack {
                    Spacer()
                        .frame(height: 50)
                    
                    ZStack(alignment: .bottom) {
                        KFImage(URL(string: "https:\(location!.cmsContent.smallHeroImage)"))
                            .cancelOnDisappear(true)
                            .placeholder {
                                Rectangle()
                                    .fill(Color("PlaceholderStamp"))
                            }
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                            .clipShape(Circle())
                        
                        if location!.offersEyeExams {
                            Text("Offers Eye Exams!")
                                .bold()
                                .font(.caption)
                                .foregroundColor(.white)
                                .padding(4)
                                .background(Color("WholesomeBlue"))
                                .cornerRadius(10)
                        }
                    }
                    
                    Text("\(location!.address.streetAddress)\n\(location!.address.locality)")
                        .font(.headline)
                        .padding()
                    
                    Text(location!.cmsContent.description)
                        .font(.body)
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    Button(action: {
                        self.action()
                    }) {
                        Text("Done")
                    }
                    
                    Spacer()
                }
                .transition(.move(edge: Edge.bottom))
            }
        }
        .onReceive(viewModel.$shouldShowDetail) { value in
            // animate the detail in from the bottom edge
            withAnimation(Animation.spring(response: 0.25, dampingFraction: 0.77, blendDuration: 100).delay(viewModel.detailTransitionDelay)) {
                self.isShowing = value
            }
        }
    }
}
