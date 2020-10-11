//
//  MenuItemDetail.swift
//  WarbyParkerStores
//
//  Created by Jonathan Lu on 10/10/20.
//

import SwiftUI

struct MenuItemDetail: View {
    var item: MenuItem
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            
            Text(item.description)
                .padding()
            
            Spacer()
        }
        .navigationBarTitle(item.name, displayMode: .inline)
    }
}

struct MenuItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MenuItemDetail(item: MenuItem.example)
        }
    }
}
