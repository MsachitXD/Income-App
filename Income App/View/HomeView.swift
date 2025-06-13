//
//  HomeView.swift
//  Income App
//
//  Created by Sachit Mittal on 12/06/25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var transactions: [Transaction] = [
        Transaction(title: "Apple", type: .expense, amount: 5.00, date: Date()),
        Transaction(title: "Samsung", type: .expense, amount: 10.00, date: Date())
    ]
    
    fileprivate func FLoatingButton() -> some View {
        VStack{
            
        }
    }
    
    fileprivate func BalanceView() -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.primaryLightGreen)
            VStack(alignment: .leading, spacing: 8){
                HStack {
                    VStack{
                        Text("BALANCE")
                            .font(.caption)
                            .foregroundColor(Color.white)
                        Text("₹2")
                            .font(.system(size: 42, weight: .light))
                            .foregroundColor(Color.white)
                    }
                        Spacer()
                }
                .padding(.top)
                HStack(spacing: 25){
                    VStack(alignment: .leading){
                        Text("Expense")
                            .font(.system(size: 15 ,weight: .semibold))
                            .foregroundColor(Color.white)
                        Text("₹22")
                            .font(.system(size: 15 ,weight: .regular))
                            .foregroundColor(Color.white)
                    }
                    VStack(alignment: .leading){
                        Text("Income")
                            .font(.system(size: 15 ,weight: .semibold))
                            .foregroundColor(Color.white)
                        Text("₹22")
                            .font(.system(size: 15 ,weight: .regular))
                            .foregroundColor(Color.white)
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
        }
        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
        .frame(height: 150)
        .padding()
    }
    
    var body: some View {
        VStack{
            BalanceView()
            List{
                ForEach(transactions) { transaction in
                    TransactionView(transaction: transaction)
                }
            }
            .scrollContentBackground(.hidden)
        }
    }
}

#Preview {
    HomeView()
}

