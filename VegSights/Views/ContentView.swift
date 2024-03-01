//
//  ContentView.swift
//  VegSights
//
//  Created by Luigi Penza on 21/02/24.
//

import SwiftUI
import SwiftData

// OCR  OPENAI PROMPT

struct ContentView: View {
    
    private let modalHeight: CGFloat = 125.0
    @State private var modaleCarina: Bool = true
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    Image("sfondino")
                        .resizable()
                        .aspectRatio(geometry.size, contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                    VStack{
                        NavigationLink {
                            ScanView()
                                .onAppear {
                                    self.modaleCarina = false
                                }
                                .onDisappear {
                                    self.modaleCarina = true
                                }
                        } label: {
                            CirclesView()
                        }
                        
                        .sheet(isPresented: $modaleCarina) {
                            ModalView()
                                .presentationDetents([.height(modalHeight), .large])
                                .interactiveDismissDisabled(true)
                                .presentationBackgroundInteraction(.enabled(upThrough: .height(modalHeight)))
                        }
                        
                    }
                }
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
                .frame(width: 250)
                .opacity(0.7)
                .offset(x: -5.0, y: -5.0)
                .rotationEffect(.degrees(rotationAngle))
            
            Circle()
                .foregroundColor(.orange)
                .frame(width: 220)
                .opacity(0.7)
                .offset(x: 10.0, y: 5.0)
                .rotationEffect(.degrees(-rotationAngle))
            
//            Text("Tap to scan")
//                .font(.title)
//                .fontWeight(.bold)
//                .frame(width: 100)
//                .multilineTextAlignment(.center)
//                .foregroundColor(colorScheme == .light ? .white : .black)
            Image("TapToScan")
                .resizable()
                .frame(width: 300, height: 300)
                .padding(.leading, -50)
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



