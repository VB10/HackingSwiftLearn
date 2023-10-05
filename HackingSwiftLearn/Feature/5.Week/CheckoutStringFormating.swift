//
//  CheckoutStringFormating.swift
//  HackingSwiftLearn
//
//  Created by vb10 on 6.10.2023.
//

import SwiftUI

struct CheckoutStringFormating: View {
    @State private var paymentType: PaymentType = .cash
    @State private var addLoyalityDetails: Bool = false
    @State private var loyalityNumber = ""
    @State private var ammount = ""
    @State private var tipAmmounts: TipAmmounts = .zero

    @State private var isAlertVisible = false

    @EnvironmentObject var order: Order

    private func checkValidaton() -> Bool {
        if tipAmmounts == .zero {
            return false
        }
        if loyalityNumber.isEmpty {
            return false
        }
        return true
    }

    private var totalPrice: String {
        guard let total = Double(ammount) else { return "" }
        let tipValue = total / 100.0 * tipAmmounts.rawValue
        return (total - tipValue).formatted(.currency(code: CurrencyType.euro.rawValue))
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
                Section {
                    VStack(content: {
                        Toggle("Add iDine loyalty card2", isOn: $addLoyalityDetails.animation())
                        TextField("Enter your ammount", text: $ammount)
                    })
                }

                if addLoyalityDetails {
                    TextField("Enter your iDine ID", text: $loyalityNumber)
                    Picker("Tips", selection: $tipAmmounts) {
                        ForEach(TipAmmounts.allCases, id: \.self) { item in
                            Text(item.rawValue.description)
                        }
                    }.pickerStyle(.menu)
                }

                Section {
                    
                    List {
                        ForEach(order.items) { item in
                            HStack {
                                Text(item.name)
                                Spacer()
                                Text("$\(item.price)")
                            }
                            
                        }.onDelete(perform: { indexSet in
                            order.items.remove(atOffsets: indexSet)
                        
                        })
                    }  .toolbar {
                        EditButton()
                    }

                }

                Spacer()
                Button {
                    isAlertVisible.toggle()
                } label: {
                    Text("Complete \(totalPrice)")
                }.disabled(!checkValidaton())

            }.navigationTitle("Payment")

        }.padding(.all, 8)
            .alert("Hello", isPresented: $isAlertVisible) {
                VStack(content: {
                    Text("Your total was \(totalPrice) - thank you")
                })
            }
            
    }
}

#Preview {
    CheckoutStringFormating()
        .environmentObject(
            Order().dummyInit())
}

enum CurrencyType: String {
    case dollar = "USD"
    case euro = "EUR"
}
