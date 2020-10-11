//
//  ItemRow.swift
//  WarbyParkerStores
//
//  Created by Jonathan Lu on 10/10/20.
//

import SwiftUI

struct MenuItemRow: View {
    static let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    
    var item: MenuItem
    
    var body: some View {
        NavigationLink(destination: MenuItemDetail(item: item)) {
            HStack {
                Image(item.thumbnailImage)
                    .clipShape(Circle())
                    //.overlay(Circle().stroke(Color.gray, lineWidth: 2))
                
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    
                    Text("$\(item.price)")
                }
                
                Spacer()
                
                ForEach(item.restrictions, id: \.self) { restriction in
                    Text(restriction)
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(5)
                        .background(Self.colors[restriction, default: .black])
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemRow(item: MenuItem.example)
    }
}