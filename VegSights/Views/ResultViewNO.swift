//
//  ResultViewNO.swift
//  VegSights
//
//  Created by Eleonora Esposito on 28/02/24.
//

import SwiftUI
import SpriteKit

struct ResultViewNO: View {
    @State private var taskIsComplete = false

    let phrase: String
    let imageName: String
    
    static let veganPhrases = [
        "Woohoo! Your product is as vegan as a field of sunflowers on a sunny day! 🌻☀️",
        "Your product is 100% animal-friendly and guilt-free! 🎊🌿",
        //   "Bravo! Your product is so vegan, it's practically doing yoga on a tofu mat! 🧘‍♂️🧘‍♀️",
        "It's a vegan win! Enjoy guilt-free munching! 🥕😋",
        "Your product is officially vegan-approved! 🌿✅"
    ]
    static let nonVeganPhrases = [
        "Alert! Non-vegan ingredients detected!",
        "No plant-powered goodness here! This product is a no-go for vegans ❌",
        "Warning: animal ingredients detected! This product doesn't make the vegan cut 🔍",
        "Uh-oh! Your product is a meaty no-no for vegans ❌",
        "Whoopsie daisy! This product isn't playing for team vegan 🚫"
    ]
    
    //TODO: Add the case of non-vegan
    init() {
        let randomIndex = Int.random(in: 0..<ResultView.nonVeganPhrases.count)
        self.phrase = ResultView.nonVeganPhrases[randomIndex]
        self.imageName = "peperoncinoNO"
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    SpriteView(scene: RainFall(), options: [.allowsTransparency])
                    VStack {
                        Image("peperoncinoNO")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        //  .overlay(
                        //   SpriteView(scene: RainFall(), options: [.allowsTransparency])
                       
                        Text(phrase)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                            .padding() // Optionally add padding for better visual appearance
                        
                        //   Spacer() // Add Spacer to push the Text to the bottom
                    }
                }
                .ignoresSafeArea()
            }
        }
        
    }
}
class RainFall: SKScene {
   override func sceneDidLoad() {
       
     size = UIScreen.main.bounds.size
     scaleMode = .resizeFill
     anchorPoint = CGPoint(x: 0.5, y: 1)
       
       backgroundColor = .clear
       let node = SKEmitterNode(fileNamed: "RainFall.sks")!
   addChild(node)
       
       node.particlePositionRange.dx =  UIScreen.main.bounds.width
    }
}

#Preview {
    ResultViewNO()
}
