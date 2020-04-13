//
//  CardCollectionViewCell.swift
//  MatchGame
//
//  Created by Saranjeet Singh on 2020-04-11.
//  Copyright © 2020 Saranjeet Singh. All rights reserved.
//

 //MARK:- this is a VIEW FILE

import UIKit

//CardCollectionViewCell is our customized class derived from UICollectionViewCell


class CardCollectionViewCell: UICollectionViewCell {
    //now cardCollectionView cell will talk to the ViewController with special communication pattern
    
    @IBOutlet weak var frontImageView: UIImageView!
    
    @IBOutlet weak var backImageView: UIImageView!
    
    var card:Card?
    
    func setCard(_ card:Card) {
        
        //keep track of the card that gets passed in
        self.card = card
        
        //frontImageView is the property of class Card in Card.swift
        
        //UIImage is An object that manages image data in your app.
        //and here we can pass in the image file name in "named"
        frontImageView.image = UIImage(named: card.imageName)
        
        //Determine if the card is in a flipped up state or flipped down state
        
        // TO DEBUG THE ERROR IN THE VIEW
        //modify our setCard method to reset by erasing the old state of the cell
        //and giving it a new state so the error of flipping one card at the top
        //also affecting the bottom card is fixed, it is being fixed by giving
        //the card all new states and desroying old ones.
        
       if card.isFlipped == true {
            //make sure the frontImageview is on top
            UIView.transition(from: backImageView, to: frontImageView, duration: 0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        }
        else {
            //make sure the backImageView is on top
            UIView.transition(from: frontImageView, to: backImageView, duration: 0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        }
    }
    //flip the card from back to front
    func flip() {
        UIView.transition(from: backImageView, to: frontImageView, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
    }
    
    func flipBack() {
        UIView.transition(from: frontImageView, to: backImageView, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
    }
}
