//
//  PBHitsListViewControllerTests.swift
//  ENBDPixabayTests
//
//  Created by Vishnu Vardhan Reddy G on 30/04/20.
//  Copyright © 2020 Vishnu. All rights reserved.
//

import FBSnapshotTestCase
@testable import ENBDPixabay

class PBHitsListViewControllerTests: FBSnapshotTestCase {
    
    override func setUp() {
        super.setUp()
        
        self.recordMode = false
    }
    
    func testThatHitsListViewControllerAppearsCorrectly() {
        
        let listVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HITSLIST") as! PBHitsListViewController
        
        let hitsList = EnbdMockProvider.getHits()
        let viewModel = PBHitsListViewModel(hitsList: hitsList?.hits)
        listVC.viewModel = viewModel
        
        FBSnapshotVerifyView(listVC.view)
        FBSnapshotVerifyLayer(listVC.view.layer)
    }
}
