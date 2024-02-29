//
//  ContentView.swift
//  VegSights
//
//  Created by Luigi Penza on 21/02/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
//    @State private var showSettings = true
    private let modalHeight: CGFloat = 100.0

    var body: some View {
        NavigationStack {
                VStack{
                    NavigationLink {
                        ScanView()
                    } label: {
                        CirclesView()
                    }
                    Text("Game app for team building")
                        .padding(50)
                }
                .sheet(isPresented: .constant(true)) {
                    ModalView()
                        .presentationDetents([.height(modalHeight), .large])
                        .interactiveDismissDisabled(true)
                        .presentationBackgroundInteraction(.enabled(upThrough: .height(modalHeight)))
                }
        }
    }
}

#Preview {
    ContentView()
}

struct CirclesView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var rotationAngle: Double = 0.0
    
    var body: some View {
        ZStack {
            
            Circle()
                .foregroundColor(.orange)
                .frame(width: 200)
                .opacity(0.7)
                .offset(x: -5.0, y: -5.0)
                .rotationEffect(.degrees(rotationAngle))
            
            Circle()
                .foregroundColor(.orange)
                .frame(width: 180)
                .opacity(0.7)
                .offset(x: 10.0, y: 5.0)
                .rotationEffect(.degrees(-rotationAngle))
            
            Text("Tap to scan")
                .font(.title)
                .fontWeight(.bold)
//                .fontDesign(.monospaced)
                .frame(width: 100)
                .multilineTextAlignment(.center)
                .foregroundColor(colorScheme == .light ? .white : .black)
        }
        .onAppear() {
            animateCircles()
        }
    }
    
    func animateCircles() {
            DispatchQueue.global(qos: .background).async {
                while true {
                    withAnimation(.linear(duration: 10.0).repeatForever(autoreverses: false)) {
                        rotationAngle = 360
                    }
                    Thread.sleep(forTimeInterval: 1.0)
                }
            }
        }
    
}



