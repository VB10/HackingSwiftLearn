//
//  CheckoutAdvanceView.swift
//  HackingSwiftLearn
//
//  Created by vb10 on 29.09.2023.
//

import SwiftUI

struct CheckoutAdvanceView: View {
    @State private var paymentType: PaymentType = .cash
    @State private var addLoyalityDetails: Bool = false
    @State private var loyalityNumber = ""
    @State private var tipAmmounts: TipAmmounts = .zero

    private func checkValidaton() -> Bool {
        if tipAmmounts == .zero {
            return false
        }

        if loyalityNumber.isEmpty {
            return false
        }

        return true
    }

    var body: some View {
        NavigationView {
            VStack {
                Section {
                    Picker("How do you want to pay", selection: $paymentType) {
                        ForEach(PaymentType.allCases, id: \.self) { item in
                            Text(item.rawValue)
                        }
                    }.pickerStyle(.navigationLink)
                }
                Toggle("Add iDine loyalty card", isOn: $addLoyalityDetails.animation())

                if addLoyalityDetails {
                    TextField("Enter your iDine ID", text: $loyalityNumber)
                    Picker("Tips", selection: $tipAmmounts) {
                        ForEach(TipAmmounts.allCases, id: \.self) { item in
                            Text(item.rawValue.description)
                        }
                    }.pickerStyle(.menu)
                }

                Spacer()
                Button {} label: {
                    Text("Complete")
                }.disabled(!checkValidaton())

            }.navigationTitle("Payment")

        }.padding(.all, 8)
    }
}

struct CheckoutAdvanceView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutAdvanceView()
    }
}

enum TipAmmounts: Double, CaseIterable {
    case ten = 10.0
    case fifteen = 15.0
    case twenty = 20.0
    case twentyFive = 25.0
    case zero = 0.0
}
