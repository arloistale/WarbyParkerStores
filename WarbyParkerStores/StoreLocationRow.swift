//
//  StoreLocationRow.swift
//  WarbyParkerStores
//
//  Created by Jonathan Lu on 10/10/20.
//

import SwiftUI
import KingfisherSwiftUI

struct StoreLocationRow: View {
    static let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]

    var location: StoreLocation
    
    var body: some View {
        NavigationLink(destination: StoreLocationDetail(location: location)) {
            HStack {
                KFImage(URL(string: "https:\(location.cmsContent.cardPhoto)"))
                    .cancelOnDisappear(true)
                    .placeholder {
                        Image(systemName: "arrow.2.circlepath.circle")
                            .font(.largeTitle)
                            .opacity(0.3)
                    }
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 100)
                
                VStack(alignment: .leading) {
                    Text(location.name)
                        .font(.headline)
                    
                    Text("\(location.address.streetAddress)\n\(location.address.locality)")
                        .font(.caption)
                }
                
                Spacer()
            }
        }
    }
}

struct StoreLocationRow_Previews: PreviewProvider {
    static var previews: some View {
        StoreLocationRow(location: StoreLocation.example)
    }
}
