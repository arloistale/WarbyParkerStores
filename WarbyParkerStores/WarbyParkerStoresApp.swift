//
//  WarbyParkerStoresApp.swift
//  WarbyParkerStores
//
//  Created by Jonathan Lu on 10/10/20.
//

import SwiftUI

@main
struct WarbyParkerStoresApp: App {
    var menuViewModel: MenuViewModel = MenuViewModel(repository: MenuRepository())
    var order: Order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppView(menuViewModel: menuViewModel, order: order)
        }
    }
}

struct WarbyParkerStoresApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
