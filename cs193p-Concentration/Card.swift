//
//  Card.swift
//  cs193p-Concentration
//
//  Created by Grigoriy Romanyuk on 3/6/19.
//  Copyright © 2019 Grigoriy Romanyuk. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
