//
//  StoreLocationRow.swift
//  WarbyParkerStores
//
//  Created by Jonathan Lu on 10/10/20.
//

import SwiftUI
import KingfisherSwiftUI

struct StoreLocationRow: View {
    static let maskFillDuration: Double = 1
    
    var location: StoreLocation
    var action: () -> Void
    
    @State private var maskFill: CGFloat = 0

    var body: some View {
        Button(action: {
            self.action()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + Self.maskFillDuration) {
                // reset the mask after finishing the animation
                withAnimation(Animation.easeInOut(duration: 0.25).delay(0.25)) {
                    self.maskFill = 0
                }
            }
            
            // animate the mask fill animation
            return withAnimation(.easeInOut(duration: StoreLocationRow.maskFillDuration)) {
                self.maskFill = 1
            }
        }) {
            ZStack {
                HStack {
                    KFImage(URL(string: "https:\(location.cmsContent.cardPhoto)"))
                        .cancelOnDisappear(true)
                        .placeholder {
                            Rectangle()
                                .fill(Color("PlaceholderStamp"))
                        }
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipped()
                    
                    VStack(alignment: .leading) {
                        Text(location.name)
                            .font(.headline)
                            .foregroundColor(Color.white)
                        
                        Text("\(location.address.streetAddress)\n\(location.address.locality), \(location.address.regionCode) \(location.address.postalCode)")
                            .font(.caption)
                            .foregroundColor(Color.white)
                    }
                    
                    Spacer()
                }
                
                // mask that animates in
                LeadingBarRectangle(fillValue: self.maskFill)
                    .fill(Color("MaskFill"))
            }
            .background(Color("WholesomeBlue"))
            .cornerRadius(5)
            .padding(.horizontal)
        }
    }
}
