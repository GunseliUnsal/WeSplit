//
//  ContentView.swift
//  WeSplit
//
//  Created by Günseli Ünsal on 18.06.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused : Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)

        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    var totalAmount: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let totalAmount = checkAmount + tipValue
        
        return totalAmount
    }
    
    
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Enter Total Amount"){
                    TextField("Amount", value: $checkAmount, format: .currency(code:
                        Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                }
                
                Picker("Number of People", selection: $numberOfPeople) {
                    ForEach(2..<100) {
                        Text("\($0) of People")
                    }
                }
        
                Section("How much do you want to tip?"){
                    Picker("Select Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Total Amount with tip"){
                    Text(totalAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }.foregroundStyle(tipPercentage == 0 ? .red : .primary)
                
                Section("Amount per person"){
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }

            }
            .navigationTitle("WeSplit 💵")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}
