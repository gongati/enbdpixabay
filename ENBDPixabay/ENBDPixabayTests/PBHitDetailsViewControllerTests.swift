//
//  PBHitDetailsViewControllerTests.swift
//  ENBDPixabayTests
//
//  Created by Vishnu Vardhan Reddy G on 30/04/20.
//  Copyright © 2020 Vishnu. All rights reserved.
//

import FBSnapshotTestCase
@testable import ENBDPixabay

class PBHitDetailsViewControllerTests: FBSnapshotTestCase {
    
    override func setUp() {
        super.setUp()
        
        self.recordMode = false
    }
    
    func testThatHitsDetailsViewControllerAppearsCorrectly() {
                
        let hitsList = EnbdMockProvider.getHits()
        let viewModel = PBHitDetailsViewModel(hit: (hitsList?.hits![1])!)
        let detailsVC = PBHitDetailsViewController(viewModel: viewModel)
        
        FBSnapshotVerifyView(detailsVC.view)
        FBSnapshotVerifyLayer(detailsVC.view.layer)
    }
}
