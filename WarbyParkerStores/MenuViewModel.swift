//
//  MenuViewModel.swift
//  WarbyParkerStores
//
//  Created by Jonathan Lu on 10/11/20.
//

import Foundation

class MenuViewModel: ObservableObject {
    var repository: MenuRepository
    
    @Published var data: MenuData
    
    init(repository: MenuRepository) {
        self.repository = repository
        self.data = MenuData(sections: [])
    }
    
    func load() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.data = self.repository.fetchMenu()
        }
    }
}
