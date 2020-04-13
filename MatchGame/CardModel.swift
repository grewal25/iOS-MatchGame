//
//  CardModel.swift
//  MatchGame
//
//  Created by Saranjeet Singh on 2020-04-11.
//  Copyright © 2020 Saranjeet Singh. All rights reserved.
//

import Foundation

class CardModdel {
    
    func getCards() -> [Card] {
        // declare an array to store the generated cards
        var generatedCardArray = [Card]()
        
        //Randomly generated pairs of cards
        for _  in 1...8 {
            //get a random number
            let randomNumber = arc4random_uniform(13) + 1
            
            //log the number
            print(randomNumber)
            
            
            //create the first card object
            //Card is described in Card.swift file, it is our main Class with
            // properties defiend there.
            
            let cardOne = Card()
            cardOne.imageName = "card\(randomNumber)"
            
            generatedCardArray.append(cardOne)
            
            //create second card object
            let cardTwo = Card()
            cardTwo.imageName = "card\(randomNumber)"
            
            generatedCardArray.append(cardTwo)
            
                //optional : make it so we only have unique pairs of cards
        }
        //TODO: randomize the array
        print("total number of random number in 2 pairs is \(generatedCardArray.count)")
        return generatedCardArray
    }
}
