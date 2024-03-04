//
//  VegSightsApp.swift
//  VegSights
//
//  Created by Luigi Penza on 21/02/24.
//

//TODO: ContentView
//TODO: ModalView
//TODO: ScanView
//TODO: ListDetailView

//TODO: Model per le liste (swiftdata?)

//TODO: Classe per comprensione del testo

//TODO: Classe per vedere se quello che lo letto sta in una lista + funzionamento?

import SwiftUI
import SwiftData

@main
struct VegSightsApp: App {
    @StateObject private var vm = AppViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
                .task {
                    await vm.requestDataScannerAccessStatus() 
                }
        }.modelContainer(for: ListModel.self)
    }
}
