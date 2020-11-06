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
     
        var milliliterConversion = [
            0: 1,
            1: 0.001,
            2: 236.588,
            3: 473.176,
            4: 3785.41
            
        ]
        
//        var litersConversion = [
//            "Milliliters": 0.001,
//            "Liters": 1,
//            "Cups": 0.236588,
//            "Pints": 0.473176,
//            "Gallons": 3.78541
//        ]
//
//        var cupsConversion = [
//            "Mililiters": 0.00422675,
//            "Liters": 4.22675,
//            "Pints": 2,
//            "Gallons": 16
//        ]
//
//        var pintsConversion = [
//            "Milliliters": 0.00211338,
//            "Liters": 2.11338,
//            "Cups": 0.5,
//            "Gallons": 8
//        ]
        
        var gallonsConversion = [
            "Mililiters": 0.000264172,
            "Liters": 0.264172,
            "Cups": 0.0625,
            "Pints": 0.125
        ]
        
//        var outputValue = Double(fromUnitType[unitAmount])
        
        // figure out what unity they're coming from
        
        switch fromUnitType {
        case 0:
            // from ml
            return unitValue * milliliterConversion[toUnitType]!
//        case 1:
//            // from L
//        case 2:
//            // from Cups
//        case 3:
//            // from Pints
//        case 4:
//            // from Gallons
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
                // the text will change to someing once the math is done
                Section (header: Text("Converted Value")){
                    Text ("\(outputValue)")
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
