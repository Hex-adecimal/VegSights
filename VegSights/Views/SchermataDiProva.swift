//
//  SchermataDiProva.swift
//  VegSights
//
//  Created by Eleonora Esposito on 01/03/24.
//

//import SwiftUI
//
//struct SchermataDiProva: View {
    
  //  @State var veganStatus: VeganType = .undefined
    
//    var body: some View {
//           NavigationStack {
//            VStack {
//                NavigationLink( "Go to Next View" ) {
//                    ResultView(veganStatus: $veganStatus)
//                }
//                .padding()
//            }
//            .navigationTitle("Main View")
//            .sensoryFeedback(trigger: veganStatus) { _, newValue in
//                return switch newValue {
//                case .notVegan:
//                        .error
//                case .vegan:
//                        .impact(weight: .heavy, intensity: 200)
//                case .undefined:
//                        .none
//                }
//            }
//            .onAppear {
//                veganStatus = .undefined
//            }
//        }
//        // .sensoryFeedback(.success, trigger: taskIsComplete)
//    }
//}
//
////        struct AnotherView: View {
////            var body: some View {
////                VStack {
////                    Text("This is Another View!")
////                        .padding()
////                }
////                .navigationTitle("Another View")
////            }
////        }
//
//#Preview {
//    SchermataDiProva()
//}
//
//
//
//enum VeganType {
//    case vegan
//    case notVegan
//    case undefined
//}
