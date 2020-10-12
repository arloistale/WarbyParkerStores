//
//  StoreLocationRow.swift
//  WarbyParkerStores
//
//  Created by Jonathan Lu on 10/10/20.
//

import SwiftUI

struct StoreLocationRow: View {
    static let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]

    var location: StoreLocation
    
    var body: some View {
        NavigationLink(destination: StoreLocationDetail(location: location)) {
            HStack {
                //Image(location.thumbnailImage)
                  //  .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text(location.name)
                        .font(.headline)
                    
                    //Text("$\(location.price)")
                }
                
                Spacer()
                
                /*
                ForEach(item.restrictions, id: \.self) { restriction in
                    Text(restriction)
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(5)
                        .background(Self.colors[restriction, default: .black])
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                }*/
            }
        }
    }
}

struct StoreLocationRow_Previews: PreviewProvider {
    static var previews: some View {
        StoreLocationRow(location: StoreLocation.example)
    }
}
