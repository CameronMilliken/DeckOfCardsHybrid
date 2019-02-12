//
//  CardViewController.swift
//  DeckOfCardsHybrid
//
//  Created by Cameron Milliken on 2/12/19.
//  Copyright © 2019 Cameron Milliken. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    
    @IBOutlet weak var cardImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    

    @IBAction func drawButtonTapped(_ sender: Any) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        CRMCardController.fetchCard { (card) in
            guard let card = card else {return}
            CRMCardController.fetchCardImage(with: card, completion: { (image) in
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    self.cardImageView.image = image
                }
            })
        }
    }
    

}
