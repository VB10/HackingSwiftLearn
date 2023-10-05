//
//  BuldingMenu.swift
//  HackingSwiftLearn
//
//  Created by vb10 on 8.09.2023.
//

import SwiftUI

struct BuldingMenu: View {
    private let title: String = "Menu"
    private let menuItem: [MenuSection]

    init() {
        menuItem = Bundle.main.decodeList(key: .menu, type: MenuSection.self)
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(menuItem) { section in
                    MenuSectionView(menuSection: section)
                }
            }
            .navigationTitle(title)
            .listStyle(.grouped)
        }
    }
}

struct BuldingMenu_Previews: PreviewProvider {
    static var previews: some View {
        BuldingMenu()
    }
}

private struct MenuSectionView: View {
    let menuSection: MenuSection
    var body: some View {
        Section {
            ForEach(menuSection.items) { item in
                Text(item.name)
            }
        } header: {
            Text(menuSection.name)
        } footer: {
            Text("Count \(menuSection.items.count.description)")
        }
    }
}
