//
//  ContentView.swift
//  UnitConversion
//
//  Created by Salvarajah, Prajina on 2020-11-05.
//

import SwiftUI


// Volume Conversion

struct ContentView: View {
    
    @State private var unitAmount = ""
    @State private var fromUnitType = 2
    @State private var toUnitType = 2
    @State private var convertedValue = 2
    
    let unitTypes = [ "Milliliters", "Litres" , "Cups" , "Pints" , "Gallons" ]
    
    var outputValue: Double {
        let unitValue = Double(unitAmount) ?? 0
     
        let milliliterConversion = [
            0: 1,
            1: 0.001,
            2: 0.00422675,
            3: 0.00211338,
            4: 0.000264172
        ]
        
        let litresConversion = [
            0: 1000,
            1: 1,
            2: 4.22675,
            3: 2.11338,
            4: 0.264172
        ]

        let cupsConversion = [
            0: 236.588,
            1: 0.236588,
            2: 1,
            3: 0.5,
            4: 0.0625
        ]

        let pintsConversion = [
            0: 473.176,
            1: 0.473176,
            2: 2,
            3: 1,
            4: 0.125
        ]
        
        let gallonsConversion = [
            0: 3785.41,
            1: 3.78541,
            2: 16,
            3: 8,
            4: 1
        ]
        
//        var outputValue = Double(fromUnitType[unitAmount])
        
        // figure out what unity they're coming from
        
        switch fromUnitType {
        case 0:
            // from ml
            return unitValue * milliliterConversion[toUnitType]!
        case 1:
            // from L
            return unitValue * litresConversion[toUnitType]!
        case 2:
            // from Cups
            return unitValue * cupsConversion[toUnitType]!
        case 3:
            // from Pints
            return unitValue * pintsConversion[toUnitType]!
        case 4:
            // from Gallons
            return unitValue * gallonsConversion[toUnitType]!
        default:
            break
        }
        
        
        return 0
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $unitAmount)
                        .keyboardType(.decimalPad)
                }
                Section (header: Text("What is your original amount unit?")){
                    Picker("Type of Unit", selection: $fromUnitType) {
                        ForEach (0 ..< unitTypes.count) {
                            Text("\(self.unitTypes[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section (header: Text("What unit do you want to convert to?")){
                    Picker("Type of Unit", selection: $toUnitType) {
                        ForEach (0 ..< unitTypes.count) {
                            Text("\(self.unitTypes[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                // To include a word from an array into the coding use a [] and it would select it
                
                Section (header: Text("Converted Value")){
                    Text ("\(outputValue, specifier: "%.2f") \(unitTypes[toUnitType])")
                }
            }
            .navigationBarTitle("Volume Conversion", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
