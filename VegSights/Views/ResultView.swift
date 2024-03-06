//
//  ResultView.swift
//  VegSights
//
//  Created by Luigi Penza on 26/02/24.
//

import SwiftUI
import SpriteKit

struct ResultView: View {
    @State private var showingChildView = false

    @State
    private var taskIsComplete: Bool = false
    
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
        let randomIndex = Int.random(in: 0..<ResultView.veganPhrases.count)
        self.phrase = ResultView.veganPhrases[randomIndex]
        self.imageName = "peperoncinoSI"
        self.taskIsComplete = true
    }
    
    var body: some View {
        VStack {
            ZStack {
                SpriteView(scene: RainFall2(), options: [.allowsTransparency])
                VStack {
                    Image("peperoncinoSI")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    Text(phrase)
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                        .padding()
                }
            }
            .ignoresSafeArea()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: ContentView()) {
                        Text("Back")
                    }
                }
            }
        }
//        .sensoryFeedback(.impact, trigger: taskIsComplete)
        
        
        
                   
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



class RainFall2: SKScene {

    override func didMove(to view: SKView) {
       
        let waitAction = SKAction.wait(forDuration: 3.0)

        // Create an action to fade out the rain
        let fadeOutAction = SKAction.fadeOut(withDuration: 2.0) // Adjust the duration as needed

        // Create an action to stop the rain (remove the emitter node from the scene)
        let stopRainAction = SKAction.run {
            if let emitterNode = self.childNode(withName: "rainEmitter") {
                emitterNode.removeFromParent()
            }
        }

        // Create a sequence of actions to wait, fade out, and then stop the rain
        let sequence = SKAction.sequence([waitAction, fadeOutAction, stopRainAction])

        // Run the sequence
        self.run(sequence)
    }

    override func sceneDidLoad() {
        // Your existing sceneDidLoad code
        size = UIScreen.main.bounds.size
        scaleMode = .resizeFill
        anchorPoint = CGPoint(x: 0.5, y: 1)

        backgroundColor = .clear
        let node = SKEmitterNode(fileNamed: "RainFall2.sks")!
        node.name = "rainEmitter"  // Set a name for the emitter node
        addChild(node)

        node.particlePositionRange.dx = UIScreen.main.bounds.width
    }
}

#Preview {
    ResultView()
}
