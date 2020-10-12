//
//  StoreLocationDetail.swift
//  WarbyParkerStores
//
//  Created by Jonathan Lu on 10/10/20.
//

import SwiftUI
import KingfisherSwiftUI

struct StoreLocationDetail: View {
    var location: StoreLocation
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                KFImage(URL(string: "https:\(location.cmsContent.smallHeroImage)"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text("Offers Eye Exams: \(String(location.offersEyeExams))")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            
            Text("\(location.address.streetAddress)\n\(location.address.locality)")
                .padding()
                .font(.body)
            
            Text(location.cmsContent.description)
                .padding()
            
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
