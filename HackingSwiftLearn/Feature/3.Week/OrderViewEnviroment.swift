//
//  OrderViewEnviroment.swift
//  HackingSwiftLearn
//
//  Created by vb10 on 22.09.2023.
//

import SwiftUI

struct OrderViewEnviroment: View {
    @EnvironmentObject var order: Order

    var body: some View {
        NavigationStack {
            List {
                ForEach(order.items) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        Text("$\(item.price)")
                    }
                }

                Section {
                    NavigationLink("Place Order") {
                        Text("Checkout")
                    }
                }
            }

        }.navigationTitle("Order")
    }
}

struct OrderViewEnviroment_Previews: PreviewProvider {
    static var previews: some View {
        OrderViewEnviroment().environmentObject(
            Order().dummyInit())
    }
}
