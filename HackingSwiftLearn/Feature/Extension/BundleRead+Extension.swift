//
//  Bundle+Read.swift
//  HackingSwiftLearn
//
//  Created by vb10 on 8.09.2023.
//

import Foundation

extension Bundle {
    static let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")

    func decodeList<T: Codable>(key: BundleItems, type: T.Type) -> Array<T> {
        return Bundle.main.decode([T].self, from: key.rawValue)
    }
}

enum BundleItems: String {
    case menu = "menu.json"
}
