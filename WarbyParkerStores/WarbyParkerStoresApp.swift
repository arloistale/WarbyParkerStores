//
//  WarbyParkerStoresApp.swift
//  WarbyParkerStores
//
//  Created by Jonathan Lu on 10/10/20.
//

import SwiftUI
import class Kingfisher.ImageCache

@main
struct WarbyParkerStoresApp: App {
    init() {
        let cache = ImageCache.default
        cache.clearMemoryCache()
        cache.clearDiskCache { print("Done") }
    }
    
    var body: some Scene {
        WindowGroup {
            AppView()
        }
    }
}

struct WarbyParkerStoresApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
