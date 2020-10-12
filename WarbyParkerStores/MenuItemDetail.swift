//
//  MenuItemDetail.swift
//  WarbyParkerStores
//
//  Created by Jonathan Lu on 10/10/20.
//

import SwiftUI

struct MenuItemDetail: View {
    var order: Order
    
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
            
            Text("$\(order.total)")
            
            Button("Add to Cart") {
                self.order.add(item: item)
            }.font(.headline)
            
            Spacer()
        }
        .navigationBarTitle(item.name, displayMode: .inline)
    }
}

struct MenuItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MenuItemDetail(order: Order(), item: MenuItem.example)
        }
    }
}
