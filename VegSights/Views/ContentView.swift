//
//  ContentView.swift
//  VegSights
//
//  Created by Luigi Penza on 21/02/24.
//

import SwiftUI
import SwiftData

enum ButtonAnimationPhase: CaseIterable {
    case beginnig, middle, end
    
    var scale: Double {
        switch self {
        case .beginnig, .end: 1
        case .middle: 0.9
        }
    }
    
    var animation: Animation {
        switch self {
        case .beginnig, .end: .bouncy(duration: 1.0)
        case .middle: .easeIn(duration: 1.0)
        }
    }
}

struct ContentView: View {
    
    @State private var isListening: Bool = false
    @State private var textToggle: Bool = false
    
    private let modalHeight: CGFloat = 100.0
    
    var body: some View {
        ZStack {
            //MARK: Background
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(.linearGradient(colors: [.orange, .yellow], startPoint: .top, endPoint: .bottom))
            
            VStack {
                //MARK: Label
                Text("Tap to scan")
                // Vision
                    .bold()
                    .foregroundStyle(.black)
                    .font(.title2)
                // Accessibility
                    .accessibilityHidden(true)
                // Animation
                
                //MARK: SHAZAM BUTTON
                CircleAndLinks()
                    .frame(width: 200, height: 200)
                //                            .onTapGesture {
                //
                //                            }
                //MARK: Button Animation
                    .phaseAnimator(ButtonAnimationPhase.allCases) { content, phase in
                        content
                            .scaleEffect(phase.scale)
                    } animation: { phase in
                        phase.animation
                    }
                
            }
        }
        .sheet(isPresented: .constant(true)) {
            NavigationStack {
                ModalView()
            }
            .presentationDetents([.height(modalHeight), .large])
            .interactiveDismissDisabled(true)
            .presentationBackgroundInteraction(.enabled(upThrough: .height(modalHeight)))
        }
    }
}


private struct CircleAndLinks: View {
    @State var animating: Bool = false
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))
                .fill(.linearGradient(colors: [.white, .gray], startPoint: .bottomLeading, endPoint: .topTrailing))
                .shadow(radius: 10, y: 10)
                .cornerRadius(30)
            // MARK: Making it for everyone
                .accessibilityLabel("Shazam")
                .accessibilityHint("Tap to listen for a song or hold to auto listen")
            
            Image(systemName: "barcode.viewfinder")
                .resizable()
                .frame(width: 130, height: 130, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .fontWeight(.light)
            
        }
    }
}

#Preview {
    ContentView()
}
