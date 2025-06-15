//
//  SettingsView.swift
//  Income App
//
//  Created by Sachit Mittal on 14/06/25.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("orderDescending") var orderDescending = false
    @AppStorage("currency") var currency : Currency = .inr
    @AppStorage("filterMinimun") var filterMinimum = 0.0
    
    var numberFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = currency.locale
        return numberFormatter
    }
    
    var body: some View {
        NavigationStack {
            List {
                HStack{
                    Toggle(isOn: $orderDescending, label: {
                        Text("Order \(orderDescending ? "(Earliest)" : "(Latest)")")
                    })
                }
                
                HStack{
                    Picker("Currency", selection: $currency) {
                        ForEach(Currency.allCases , id: \.self) { currency in
                            Text(currency.title)
                        }
                    }
                }
                HStack{
                    Text("Filter Minimum")
                    TextField("", value: $filterMinimum, formatter: numberFormatter)
                        .multilineTextAlignment(.trailing)
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
