//
//  SchermataDiProva1.swift
//  VegSights
//
//  Created by Eleonora Esposito on 04/03/24.
//

//import SwiftUI
//
//struct SchermataDiProva1: View {
//    @State
//    var veganStatus1: VeganType = .undefined
//    
//    var body: some View {
//        NavigationStack {
//            VStack {
//                NavigationLink( "Go to Next View" ) {
//                    ResultView(veganStatus1: $veganStatus1)
//                }
//                .padding()
//            }
//            .navigationTitle("Main View")
//            .sensoryFeedback(trigger: veganStatus1) { _, newValue in
//                return switch newValue {
//                case .notVegan:
//                        .impact(weight: .heavy, intensity: 200)
//                case .vegan:
//                        .error
//                case .undefined:
//                        .none
//                }
//            }
//            .onAppear {
//                veganStatus1 = .undefined
//            }
//        }
//        // .sensoryFeedback(.success, trigger: taskIsComplete)
//    }
//}
//
//#Preview {
//    SchermataDiProva1()
//}
//
//enum VeganType {
//    case vegan
//    case notVegan
//    case undefined
//}
