//
//  ContentView.swift
//  WarbyParkerStores
//
//  Created by Jonathan Lu on 10/10/20.
//

import SwiftUI

struct MenuView: View {
    @ObservedObject var menuViewModel: MenuViewModel
    var order: Order
    
    var body: some View {
        NavigationView {
            List {
                ForEach(menuViewModel.data.sections) { section in
                    Section(header: Text(section.name)) {
                        ForEach(section.items) { item in
                            MenuItemRow(order: order, item: item)
                        }
                    }
                }
            }
            .navigationBarTitle("Menu")
            .listStyle(GroupedListStyle())
            .onAppear {
                menuViewModel.load()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(menuViewModel: MenuViewModel(repository:  MenuRepository()), order: Order())
    }
}
