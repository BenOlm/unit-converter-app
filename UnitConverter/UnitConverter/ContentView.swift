//
//  ContentView.swift
//  UnitConverter
//
//  Created by Ben Mingham on 19/09/22.
//


import SwiftUI
struct ContentView: View {

    let units = [UnitLength.meters, UnitLength.kilometers, UnitLength.feet, UnitLength.yards, UnitLength.miles]
    
    @State private var input: Double = 0.00
    @State private var inputUnit = UnitLength.meters
    @State private var outputUnit = UnitLength.meters
    
    private var output: Double {
        let inputMeasurement = Measurement(value: input, unit: inputUnit)
        let outputMeasurement = inputMeasurement.converted(to: outputUnit)
        return outputMeasurement.value
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                
                Section {
                    TextField("", value: $input, format: .number)
                } header: {
                    Text("Enter unit")
                } .keyboardType(.decimalPad)
                
                Section {
                    Picker("", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0.symbol)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("From")
                }
                
                Section {
                    Picker("", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0.symbol)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("To")
                }
                
                Section {
                    Text(output, format: .number)
                } header: {
                    Text("Result")
                }
            }
            .navigationTitle("Unit Converter")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
