//
//  AppView.swift
//  WarbyParkerStores
//
//  Created by Jonathan Lu on 10/11/20.
//

import SwiftUI

struct AppView: View {
    var menuViewModel: MenuViewModel
    
    @ObservedObject var order: Order
    
    var body: some View {
        TabView {
            MenuView(menuViewModel: menuViewModel, order: order)
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Menu")
                }
            
            OrderView(order: order)
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Order")
                }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView(menuViewModel: MenuViewModel(repository: MenuRepository()), order: Order())
    }
}
