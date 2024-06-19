//
//  timeConverter.swift
//  WeSplit
//
//  Created by Günseli Ünsal on 19.06.2024.
//

import SwiftUI

struct TimeConverter: View {
    @State private var selectedInput = "minutes"
    @State private var selectedOutput = "hours"
    @State private var inputNumber = ""
    @State private var convertedNumber = ""
    
    let timeArray = ["seconds", "minutes", "hours", "days"]
    
    var convertedValue: Double {
        let inputValue = Double(inputNumber) ?? 0.0
        let inputInSeconds = inputValue * inputToSeconds(selectedInput)
        let outputValue = inputInSeconds / inputToSeconds(selectedOutput)
        return outputValue
    }
    
    func inputToSeconds(_ unit: String) -> Double {
        switch unit {
        case "seconds":
            return 1.0
        case "minutes":
            return 60.0
        case "hours":
            return 3600.0
        case "days":
            return 86400.0
        default:
            return 1.0
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input Unit")) {
                    Picker("Input Unit", selection: $selectedInput) {
                        ForEach(timeArray, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section(header: Text("Output Unit")) {
                    Picker("Output Unit", selection: $selectedOutput) {
                        ForEach(timeArray, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section(header: Text("Enter your number")) {
                    TextField("Enter Number", text: $inputNumber)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Converted Number")) {
                    Text("\(convertedValue, specifier: "%.2f")")
                }
            }
            .navigationTitle("Time Converter ⏳")
        }
    }
}


#Preview {
    TimeConverter()
}
