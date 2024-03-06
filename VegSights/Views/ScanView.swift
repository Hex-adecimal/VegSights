//
//  ScanView.swift
//  VegSights
//
//  Created by Luigi Penza on 22/02/24.
//

import SwiftUI
import PhotosUI
import Vision

struct ScanView: View {
    @EnvironmentObject var vm: AppViewModel
    
    var body: some View {
        switch vm.dataScannerAccessStatus {
        case .notDetermined:
            Text("notDetermined")
        case .cameraAccessNotGranted:
            Text("cameraAccessNotGranted")
        case .cameraNotAvailable:
            Text("cameraNotAvailable")
        case .scannerAvailable:
            mainView
        case .scannerNotAvailable:
            Text("scannerNotAvailable")
        }
    }
    
    private func isVegan(_ inputString: String) -> Bool{
        let meatKeywords = ["suino", "carne", "manzo", "maiale", "pollo", "agnello", "pesce", "latte", "formaggio", "burro", "panna", "yogurt", "uova", "albume", "tuorlo", "gelatina", "caseina", "siero del latte", "lattosio", "miele", "collagene", "miele", "cera d'api", "glicerina", "lanolina", "acido stearico", "gelatina", "colla animale", "e120", "estratto di cochi", "olio di pesce", "tutti i tipi di carne e derivati", "fonduta di carne", "brodo di carne","pig", "meat", "beef", "pork", "chicken", "lamb", "fish", "milk", "cheese", "butter", "cream", "yogurt", "eggs", "egg white", "egg yolk", "gelatin", "casein", "whey", "lactose", "honey", "collagen", "honey", "beeswax", "glycerin", "lanolin", "stearic acid", "gelatin", "animal glue", "E120 (cochineal)", "fish oil", "all types of meat and derivatives", "meat fondue", "meat broth"]
        
            let lowercasedString = inputString.lowercased()
            let words = lowercasedString.components(separatedBy: CharacterSet.whitespacesAndNewlines)

            for word in words {
                for keyword in meatKeywords {
                    if word.contains(keyword) {
                        return true
                    }
                }
            }

            return false
        }
    
    private var mainView: some View {
        NavigationStack {
            DataScannerView(
                recognizedItems: $vm.recognizedItem,
                recognizedDataType: vm.recognizedDataType,
                recognizesMultipleItems: vm.recognizedMultipleItems)
            ScrollView {
                ForEach(vm.recognizedItem) { item in
                    switch item {
                    case .text(let text):
                        Text(text.transcript)
                            .foregroundStyle(isVegan(text.transcript) ? .red : .green)
                        
                    case .barcode(let barcode):
                        Text (barcode.payloadStringValue ?? "Unknown barcode")
                    @unknown default:
                        Text("Unknown")
                    }
                
                }
            }
        }
    }
}

#Preview {
    ScanView()
}
