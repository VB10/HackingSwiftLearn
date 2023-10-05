//
//  PolishingDesingWithColor.swift
//  HackingSwiftLearn
//
//  Created by vb10 on 15.09.2023.
//

import SwiftUI

struct PolishingDesingWithColor: View {
    private let menuItem: [MenuSection]

    init() {
        self.menuItem = Bundle.main.decodeList(key: .menu, type: MenuSection.self)
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(menuItem) { section in
                    Section {
                        ForEach(section.items) { item in
                            ItemSubRow(item: item)
                        }
                    } header: {
                        Text(section.name)
                            .font(.headline)
                    }
                }
            }
            .navigationTitle("Menu")
            .listStyle(.grouped)
        }
    }
}

private struct ItemSubRow: View {
    let item: MenuItem
    private let circle = Circle()

    var body: some View {
        HStack {
            Image(item.thumbnailImage)
                .circleShapeWithBorder()
            VStack(alignment: .leading) {
                Text(item.name)
                HStack {
                    Text("\(item.price)$")
                    Spacer()
                    ForEach(item.restrictions, id: \.self) { restrication in
                        Text(restrication)
                            .restrictStyle()
                            .background(RestirctionColor.color(value: restrication))
                    }
                }
            }
        }
    }
}

struct PolishingDesingWithColor_Previews: PreviewProvider {
    static var previews: some View {
        PolishingDesingWithColor()
    }
}

private extension Text {
    func restrictStyle() -> some View {
        return self.font(.caption)
            .fontWeight(.bold)
            .padding(5)

            .clipShape(Circle())
            .foregroundColor(.white)
    }
}

private enum RestirctionColor: String {
    case D
    case G
    case N
    case V

    static func color(value: String) -> Color {
        switch value {
        case RestirctionColor.D.rawValue:
            return Color.purple
        case RestirctionColor.G.rawValue:
            return Color.black
        case RestirctionColor.N.rawValue:
            return Color.blue
        case RestirctionColor.V.rawValue:
            return Color.green
        default:
            return Color.black
        }
    }
}
