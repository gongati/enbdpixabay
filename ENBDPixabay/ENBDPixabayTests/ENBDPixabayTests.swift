//
//  ENBDPixabayTests.swift
//  ENBDPixabayTests
//
//  Created by Vishnu Vardhan Reddy G on 29/04/20.
//  Copyright © 2020 Vishnu. All rights reserved.
//

import XCTest
@testable import ENBDPixabay

class ENBDPixabayTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}

class EnbdMockProvider {

    static func getHits() -> PBHitsResponse? {
        
        if let data = EnbdMockProvider.dataFromFileInTestBundle(fileName: "PBHits", withExtension: "json") {
            
            do {
                
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(PBHitsResponse.self, from: data)
                return jsonData
            } catch {
                
                print("error:\(error)")
            }
        }
        
        return nil
    }

    static func dataFromFileInTestBundle(fileName: String, withExtension extension: String) -> Data? {
        
        guard let url = Bundle(for: EnbdMockProvider.self).url(forResource: fileName, withExtension: `extension`) else {
            
            return nil
        }
        
        do {
            
            return try Data(contentsOf: url)
        }
        catch {
            
            return nil
        }
    }
}
