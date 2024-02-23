////
////  CheckMarkView.swift
////  VegSights
////
////  Created by Benedetta Beatrice on 22/02/24.
////
//
//import SwiftUI
//
//
//struct CheckmarkView: View {
//    @Binding var isChecked: Bool
//
//    var body: some View {
//        ZStack {
//            Circle()
//                .fill(isChecked ? Color.blue : Color.clear) // Change the color based on the isChecked state
//                .frame(width: 30, height: 30)
//                .overlay(
//                    Circle()
//                        .stroke(Color.blue, lineWidth: 2)
//                )
//            
//            if isChecked {
//                Image(systemName: "checkmark")
//                    .foregroundColor(.white)
//            }
//        }
//        .onTapGesture {
//            isChecked.toggle()
//        }
//    }
//}
//
//
//
//struct CheckmarkView_Previews: PreviewProvider {
//    static var previews: some View {
//        CheckmarkView(isChecked: .constant(false))
//    }
//}
//
