//
//  CheckoutView.swift
//  HackingSwiftLearn
//
//  Created by vb10 on 29.09.2023.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
//    let paymentTypes: Array<String> = ["Cash", "Credit Card", "iDine Points"]
//
    @State private var paymentType: PaymentType = .cash

    var body: some View {
        VStack {
            Section {
                Picker("How do you want to pay", selection: $paymentType) {
                    ForEach(PaymentType.allCases, id: \.self) { item in
                        Text(item.rawValue)
                    }
                }.pickerStyle(.menu)
                
               
            }
            Button("Change") {
                paymentType = .dinePoints
            }
        }
    }
}

enum PaymentType: String, CaseIterable {
    case cash
    case creditCard
    case dinePoints
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView().environmentObject(Order())
    }
}
