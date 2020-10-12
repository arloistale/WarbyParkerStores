//
//  MenuRepository.swift
//  WarbyParkerStores
//
//  Created by Jonathan Lu on 10/11/20.
//

import Foundation

protocol StoreLocationsRepository {
    func fetchData(completion: @escaping (MenuData) -> Void)
}

class MenuRepositoryImpl: StoreLocationsRepository {
    func fetchData(completion: @escaping (MenuData) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let sections = Bundle.main.decode([MenuSection].self, from: "menu.json")
            completion(MenuData(sections: sections))
        }
    }
}

struct MenuRepositoryMock: StoreLocationsRepository {
    let mockData: MenuData
    
    func fetchData(completion: @escaping (MenuData) -> Void) {
        completion(mockData)
    }
}
