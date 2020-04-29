//
//  ViewController.swift
//  ENBDPixabay
//
//  Created by Vishnu Vardhan Reddy G on 29/04/20.
//  Copyright © 2020 Vishnu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getImages(_ sender: UIButton) {
        
        let networkManager = PBNetworkManager()
        
        networkManager.getNewHits(page: 1, query: "apple") { (hits, error) in
            
            if error == nil {
                print(hits)
            }
            
        }
    }
}

