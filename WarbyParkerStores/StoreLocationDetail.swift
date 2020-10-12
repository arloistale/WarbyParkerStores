//
//  StoreLocationDetail.swift
//  WarbyParkerStores
//
//  Created by Jonathan Lu on 10/10/20.
//

import SwiftUI
import KingfisherSwiftUI

struct StoreLocationDetail: View {
    let heroImageFrameHeight: CGFloat = 200
    let topSpacerHeight: CGFloat = 50
    
    var location: StoreLocation
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: topSpacerHeight)
            
            ZStack(alignment: .bottom) {
                KFImage(URL(string: "https:\(location.cmsContent.smallHeroImage)"))
                    .cancelOnDisappear(true)
                    .placeholder {
                        Rectangle()
                            .fill(Color("PlaceholderStamp"))
                    }
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: heroImageFrameHeight)
                    .clipShape(Circle())
                    .clipped()
                    .padding(.top)
                
                if location.offersEyeExams {
                    Text("Offers Eye Exams!")
                        .bold()
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(4)
                        .background(Color("WholesomeBlue"))
                        .cornerRadius(10)
                }
            }
            
            Text("\(location.address.streetAddress)\n\(location.address.locality)")
                .font(.headline)
                .padding()
            
            Text(location.cmsContent.description)
                .font(.body)
                .padding(.horizontal)
            
            Spacer()
        }
        .navigationBarTitle(location.name, displayMode: .inline)
    }
}

struct StoreLocationDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StoreLocationDetail(location: StoreLocation.example)
        }
    }
}
