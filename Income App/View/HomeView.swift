//
//  HomeView.swift
//  Income App
//
//  Created by Sachit Mittal on 12/06/25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var transactions: [Transaction] = []
    @State private var showAddTransactionView = false
    @State private var transactionToEdit: Transaction?
    
   private var expenses : String {
       let sumExpenses = transactions.filter({ $0.type == .expense }).reduce(0, { $0 + $1.amount})
//        for transaction in transactions {
//            if transaction.type == .expense {
//                sumExpenses += transaction.amount
//            }
//        }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        return numberFormatter.string(from: sumExpenses as NSNumber) ?? "₹0.00"
    }
    
    private var income : String {
        let sumIncome = transactions.filter({ $0.type == .income }).reduce(0, { $0 + $1.amount})
//        for transaction in transactions {
//            if transaction.type == .expense {
//                sumIncome += transaction.amount
//            }
//        }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        return numberFormatter.string(from: sumIncome as NSNumber) ?? "₹0.00"
    }
    
    private var total : String {
        let sumExpenses = transactions.filter({ $0.type == .expense }).reduce(0, { $0 + $1.amount})
        let sumIncome = transactions.filter({ $0.type == .income }).reduce(0, { $0 + $1.amount})
        let total = sumIncome - sumExpenses
//        for transaction in transactions {
//            switch transaction.type {
//            case .income:
//                total += transaction.amount
//            case .expense:
//                total -= transaction.amount
//            }
//        }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        return numberFormatter.string(from: total as NSNumber) ?? "₹0.00"
    }
    
    fileprivate func FLoatingButton() -> some View {
        VStack{
            Spacer()
            NavigationLink{
                AddTransactionView(transactions: $transactions)
            } label: {
                Text("+")
                    .font(.largeTitle)
                    .frame(width: 70, height: 70)
                    .foregroundColor(Color.white)
                    .padding(.bottom, 7)
            }
            .background(.primaryLightGreen)
            .clipShape(Circle())
        }
    }
    
    fileprivate func BalanceView() -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.primaryLightGreen)
            VStack(alignment: .leading, spacing: 8){
                HStack {
                    VStack(alignment: .leading){
                        Text("BALANCE")
                            .font(.caption)
                            .foregroundColor(Color.white)
                        Text("\(total)")
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
                        Text("\(expenses)")
                            .font(.system(size: 15 ,weight: .regular))
                            .foregroundColor(Color.white)
                    }
                    VStack(alignment: .leading){
                        Text("Income")
                            .font(.system(size: 15 ,weight: .semibold))
                            .foregroundColor(Color.white)
                        Text("\(income)")
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
        NavigationStack {
            ZStack {
                VStack{
                    BalanceView()
                    List{
                        ForEach(transactions) { transaction in
                            Button(action: {
                                transactionToEdit = transaction
                            }, label: {
                                TransactionView(transaction: transaction)
                                    .foregroundColor(.black)
                            })
                        }
                        .onDelete(perform: delete)
                    }
                    .scrollContentBackground(.hidden)
                }
                FLoatingButton()
            }
            .navigationTitle("Income")
            .navigationDestination(item: $transactionToEdit, destination: { transactionToEdit in
                AddTransactionView(transactions: $transactions, transactionToEdit: transactionToEdit)
            })
            .navigationDestination(isPresented: $showAddTransactionView, destination: {
                AddTransactionView(transactions: $transactions)
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(Color.black)
                    })
                }
            }
        }
    }
    
    private func delete(at offset: IndexSet) {
        transactions.remove(atOffsets: offset)
    }
}

#Preview {
    HomeView()
}

