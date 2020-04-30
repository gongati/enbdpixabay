//
//  PBHitDetailsViewController.swift
//  ENBDPixabay
//
//  Created by Vishnu Vardhan Reddy G on 29/04/20.
//  Copyright © 2020 Vishnu. All rights reserved.
//

import UIKit
import SnapKit

class PBHitDetailsViewController: UIViewController {

    let viewModel: PBHitDetailsViewModel
    
    private lazy var imageView: UIImageView = {
        
        let imageView = UIImageView()
        
        return imageView
    }()
    
    private lazy var likesButton: UIButton = {
        
        let button = UIButton()
        button.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
        button.tintColor = .systemBlue
        button.setTitleColor(.black, for: .normal)

        return button
    }()
    
    private lazy var commentsButton: UIButton = {

        let button = UIButton()
        button.setImage(UIImage(systemName: "bubble.left.and.bubble.right.fill"), for: .normal)
        button.tintColor = .systemBlue
        button.setTitleColor(.black, for: .normal)

        return button
    }()
    
    private lazy var favButton: UIButton = {

        let button = UIButton()
        button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        button.tintColor = .systemBlue
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
    private lazy var buttonBGView: UIView = {
        
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    init(viewModel: PBHitDetailsViewModel) {
        
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        
        self.title = self.viewModel.pageTitle
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View life cycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.setupViews()
        self.setupConstraints()
    }
    
    // MARK: - setup views
    func setupViews() {
        
        self.view.addSubview(self.imageView)
        self.view.addSubview(self.buttonBGView)
        self.buttonBGView.addSubview(self.favButton)
        self.buttonBGView.addSubview(self.commentsButton)
        self.buttonBGView.addSubview(self.likesButton)
        
        self.favButton.setTitle("\(self.viewModel.favs)", for: .normal)
        self.commentsButton.setTitle("\(self.viewModel.comments)", for: .normal)
        self.likesButton.setTitle("\(self.viewModel.likes)", for: .normal)
        
        self.imageView.downloaded(from: self.viewModel.image)
    }
    
    // MARK: - setup constraints
    func setupConstraints() {
        
        self.imageView.snp.makeConstraints { make in
            
            make.edges.equalToSuperview()
        }
        
        self.buttonBGView.snp.makeConstraints { make in
            
            make.bottom.equalToSuperview().offset(-100)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        
        self.likesButton.snp.makeConstraints { make in
            
            make.top.equalToSuperview().offset(15)
            make.leading.equalToSuperview().offset(15)
            make.width.equalTo(100)
        }
        
        self.commentsButton.snp.makeConstraints { make in
            
            make.centerY.equalTo(self.likesButton)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
        }
        
        self.favButton.snp.makeConstraints { make in
            
            make.centerY.equalTo(self.likesButton)
            make.trailing.equalToSuperview().offset(-15)
            make.width.equalTo(100)
        }
    }
}
