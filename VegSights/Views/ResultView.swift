//
//  ResultView.swift
//  VegSights
//
//  Created by Luigi Penza on 26/02/24.
//

import SwiftUI

struct ResultView: View {
    let phrase: String
    let imageName: String
    
    static let veganPhrases = [
            "Woohoo! Your product is as vegan as a field of sunflowers on a sunny day! 🌻☀️",
            "It's a plant-based party up in here! Your product is 100% animal-friendly and guilt-free! 🎊🌿",
            "Bravo! Your product is so vegan, it's practically doing yoga on a tofu mat! 🧘‍♂️🧘‍♀️",
            "It's a vegan win! Enjoy guilt-free munching! 🥕😋",
            "Plant-powered goodness confirmed! Your product is officially vegan-approved! 🌿✅"
        ]
    static let nonVeganPhrases = [
            "Alert! Non-vegan ingredients detected! Looks like this one's a pass for our plant-based pals. 🚫",
            "No plant-powered goodness here! This product is a no-go for vegans. Better luck next time! ❌",
           "Warning: animal ingredients detected! This product doesn't make the vegan cut. Back to the shelf it goes! 🔍",
            "Uh-oh! Your product is a meaty no-no for vegans. Keep searching for those compassionate choices! ❌",
            "Whoopsie daisy! This product isn't playing for team vegan. Keep hunting for those plant-powered goodies! 🚫"
        ]
    
    //TODO: Add the case of non-vegan
    init() {
        let randomIndex = Int.random(in: 0..<ResultView.veganPhrases.count)
        self.phrase = ResultView.veganPhrases[randomIndex]
        self.imageName = "veganOk"
    }

    var body: some View {
        VStack {
            Text(phrase)
                .font(.headline)
                .multilineTextAlignment(.leading)
                .padding()
            
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
        }
    }
}
