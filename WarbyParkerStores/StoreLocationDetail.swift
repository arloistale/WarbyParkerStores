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
    var action: () -> Void
    
    @State private var contentOffset: CGFloat = 1500
    
    var body: some View {
        ZStack {
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
                
                Button(action: {
                    self.action()
                }) {
                    Text("Done")
                }
                
                Spacer()
            }
        }
        .offset(x: 0, y: contentOffset)
        .onAppear {
            withAnimation(.spring(response: 0.25, dampingFraction: 0.77, blendDuration: 100)) {
                self.contentOffset = 0
            }
        }
    }
}

struct StoreLocationDetail_Previews: PreviewProvider {
    static var previews: some View {
        StoreLocationDetail(location: StoreLocation.example) {
            
        }
    }
}
