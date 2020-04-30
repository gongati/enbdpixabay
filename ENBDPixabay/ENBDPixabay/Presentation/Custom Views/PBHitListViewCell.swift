//
//  PBHitListViewCell.swift
//  ENBDPixabay
//
//  Created by Vishnu Vardhan Reddy G on 30/04/20.
//  Copyright © 2020 Vishnu. All rights reserved.
//

import UIKit

class PBHitListViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var likesButton: UIButton!
    
    func update(hit: PBHit) {
        
        self.titleLabel.text = hit.tags
        self.subLabel.text = "by \(hit.user ?? "")"
        self.likesButton.setTitle("\(hit.likes ?? 0)", for: .normal)
        self.iconImageView.image = nil

        if let logoUrl = hit.previewURL {

            self.iconImageView.downloaded(from: logoUrl)
        }
    }
}
