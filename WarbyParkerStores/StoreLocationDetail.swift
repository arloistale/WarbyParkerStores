//
//  StoreLocationDetail.swift
//  WarbyParkerStores
//
//  Created by Jonathan Lu on 10/10/20.
//

import SwiftUI

struct StoreLocationDetail: View {
    var location: StoreLocation
    
    var body: some View {
        VStack {
            /*
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }*/
            
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
