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
    
    let unitTypes = [ "Milliliters", "Liters" , "Cups" , "Pints" , "Gallons" ]
    
    var outputValue: Double {
        let unitValue = Double(unitAmount) ?? 0
        let firstUnitSelection = Double(unitTypes[fromUnitType])
        
        
        let unitLiters = Measurement(value: unitValue, unit: UnitVolume.liters)
        let litersToML = unitLiters.converted(to: .milliliters)
        
        let unitCups = Measurement(value: unitValue, unit: UnitVolume.cups)
        let cupsToML = unitCups.converted(to: .milliliters)
        
        let unitPints = Measurement(value: unitValue, unit: UnitVolume.pints)
        let pintsToML = unitPints.converted(to: .milliliters)
        
        let unitGallons = Measurement(value: unitValue, unit: UnitVolume.gallons)
        let gallonsToML = unitGallons.converted(to: .milliliters)
        
        
        
        
        
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
                    Picker("Type of Unit", selection: $toUnitType) {
                        ForEach (0 ..< unitTypes.count) {
                            Text("\(self.unitTypes[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section (header: Text("What unit do you want to convert to?")){
                    Picker("Type of Unit", selection: $fromUnitType) {
                        ForEach (0 ..< unitTypes.count) {
                            Text("\(self.unitTypes[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                // the text will change to someing once the math is done
                Section (header: Text("Converted Value")){
                    Text ("\(convertedValue)")
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
