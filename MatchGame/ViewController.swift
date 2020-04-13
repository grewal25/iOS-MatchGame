//
//  ViewController.swift
//  MatchGame
//
//  Created by Saranjeet Singh on 2020-04-11.
//  Copyright © 2020 Saranjeet Singh. All rights reserved.
//

 //MARK:- this is a CONTROLLER FILE


import UIKit

//
class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var model = CardModdel()
    var cardArray = [Card]()
    
    var firstFlippedCardIndex: IndexPath?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //call the getCards method of the card model
        
        //calling function getCards inside CardModel.swift
        cardArray = model.getCards()
        
        //protocols
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
        
        
        
    }

    //MARK: - UICollectionView protocol methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section:Int) -> Int {
        
        //in the "numberOfItemsInSection" method, we need to tell the tableview how many items we have.
        
        //section
        //An index number identifying a section in collectionView. This index value is 0-based.
        print("the cardArray count is \(cardArray.count)")
        return cardArray.count
        
    }
    //MARK:- this function is to return a simple cell structure to show the images
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //(return type is UICollectionViewCell, so this function must return a m x n matrix of cells)
        
        // get a CardCollectionViewCell object
        
        //CardCell is the instance of CardCollectionViewCell defined in main.story
        
        //and dequeResuableCell doesn't know about any of the custom classes like ours "CardCollectionViewCell" so we use as!
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
        // get the card that the collection view is trying to display
        let card = cardArray[indexPath.row]
        
        // set that card for the cell
        //becasue cell is from CardCollectionViewCell, we can use our pre-defined function setCard() method here
        cell.setCard(card)
        print("index path is  \(indexPath.row)")
//        print("cell is \(cell)")
        return cell
    }
     //MARK:- this function is to show right card after flipping
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //get the cell that the user selected
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        
        let card = cardArray[indexPath.row]
        
        if card.isFlipped == false {
            //flip the cell
            cell.flip()
            
            card.isFlipped = true
            
            //determine if its the first card or second card thats flipped over
            if firstFlippedCardIndex == nil {
                
                //this is the first card being flipped
                firstFlippedCardIndex = indexPath
            }
            else {
                //this is the second card being flipped
                
            }
        }

    } //end of the didSelect method
    
    //MARK: - Game Logic Method
    
    func checkForMatches(_ secondFlippedCardIndex: IndexPath) {
        // get the cells for the two card were revealed
        
//        let card
        
        //get the card for the two cards that were revealed
    }
    
    
} //end of view controller

