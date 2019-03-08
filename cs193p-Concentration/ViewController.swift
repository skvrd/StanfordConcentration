//
//  ViewController.swift
//  cs193p-Concentration
//
//  Created by Grigoriy Romanyuk on 3/5/19.
//  Copyright © 2019 Grigoriy Romanyuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var numberOfPairOfCards: Int {
        return (cardButtons.count + 1) / 2
    }
    
    private lazy var game = Concentraion(numberOfPairOfCards: numberOfPairOfCards)
    
    private(set) var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        let cardNumber = cardButtons.index(of: sender)!
        game.chooseCard(at: cardNumber)
        updateViewFromModel()
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                print("Card with index \(index) isMatched = \(card.isMatched)")
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9607843137, green: 0.5450980392, blue: 0, alpha: 0) : #colorLiteral(red: 0.9607843137, green: 0.5450980392, blue: 0, alpha: 1)
            }
        }
    }
    
    private var emojiChoices = ["👻","🎃","🍭","👹","👿","🤖","☠️","👾","🧟‍♂️","🧛‍♀️","🧙‍♀️","🏴‍☠️","🚀"]
    
    private var emoji = [Int:String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            
        }
        
        return emoji[card.identifier] ?? "?"
    }

}
