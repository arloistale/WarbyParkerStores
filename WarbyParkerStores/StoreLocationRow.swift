//
//  StoreLocationRow.swift
//  WarbyParkerStores
//
//  Created by Jonathan Lu on 10/10/20.
//

import SwiftUI
import KingfisherSwiftUI

struct StoreLocationRow: View {
    let cardPhotoFrameWidth: CGFloat = 100
    
    var location: StoreLocation
    var action: () -> Void
    
    @State private var maskFill: CGFloat = 0

    var body: some View {
        ZStack {
            Button(action: {
                self.action()
                self.maskFill = 1
            }) {
                HStack {
                    KFImage(URL(string: "https:\(location.cmsContent.cardPhoto)"))
                        .cancelOnDisappear(true)
                        .placeholder {
                            Rectangle()
                                .fill(Color("PlaceholderStamp"))
                        }
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: cardPhotoFrameWidth, height: cardPhotoFrameWidth)
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
                .background(Color("WholesomeBlue"))
                .cornerRadius(5)
                .padding(.horizontal)
            }
                /*
            // mask that animates in
            Rectangle()
                .fill(Color("MaskFill"))
                .scaleEffect(maskFill)
                .animation(.default)*/
        }
    }
}

struct StoreLocationRow_Previews: PreviewProvider {
    static var previews: some View {
        StoreLocationRow(location: StoreLocation.example) {
            
        }
    }
}
