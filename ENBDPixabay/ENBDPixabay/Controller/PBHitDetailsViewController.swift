//
//  PBHitDetailsViewController.swift
//  ENBDPixabay
//
//  Created by Vishnu Vardhan Reddy G on 29/04/20.
//  Copyright © 2020 Vishnu. All rights reserved.
//

import UIKit

class PBHitDetailsViewController: UIViewController {

    let viewModel = PBHitDetailsViewModel()
    var hit:PBHit?
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var likesButton: UIButton!
    @IBOutlet weak var commentsButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = self.hit?.tags
        if let hit = self.hit {
            
            self.updateViews(hit: hit)
        }
    }
    
    func updateViews(hit: PBHit) {
        
        self.imageView.downloaded(from: hit.largeImageURL ?? "")
        self.favButton.setTitle("\(hit.favorites ?? 0)", for: .normal)
        self.commentsButton.setTitle("\(hit.comments ?? 0)", for: .normal)
        self.likesButton.setTitle("\(hit.likes ?? 0)", for: .normal)
    }
}
