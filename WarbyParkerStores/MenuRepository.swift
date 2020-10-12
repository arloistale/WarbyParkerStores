//
//  MenuRepository.swift
//  WarbyParkerStores
//
//  Created by Jonathan Lu on 10/11/20.
//

import Foundation

class MenuRepository {
    func fetchMenu() -> MenuData {
        let sections = Bundle.main.decode([MenuSection].self, from: "menu.json")
        return MenuData(sections: sections)
    }
}
