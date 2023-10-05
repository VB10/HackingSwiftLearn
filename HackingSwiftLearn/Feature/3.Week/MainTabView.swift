//
//  MainTabView.swift
//  HackingSwiftLearn
//
//  Created by vb10 on 22.09.2023.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ForEach(MainTabViewItems.items) { item in
                item.view.tabItem {
                    Label(item.title, systemImage: item.images.rawValue)
                }
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView().environmentObject(Order())
    }
}

private struct MainTabViewItems: Identifiable {
    let title: String
    let images: SystemImages
    let view: AnyView
    let id = UUID()

    init(title: String, images: SystemImages, view: any View) {
        self.title = title
        self.images = images
        self.view = AnyView(view)
    }

    static let items: [MainTabViewItems] = [
        MainTabViewItems(title: "Menu", images: .home, view: DisplayDetailScreenWithNavigation()),
        MainTabViewItems(title: "Contact", images: .contact, view: OrderViewEnviroment())
    ]
}
