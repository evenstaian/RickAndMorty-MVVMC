//
//  CharactersUITests.swift
//  EvensTaianStoneChallengeUITests
//
//  Created by Evens Taian on 15/08/23.
//

import XCTest

class CharactersUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func testIf_bannerImage_exists() throws {
        app.launch()

        let bannerImage = app.images["Banner"]
        XCTAssertTrue(bannerImage.exists)
    }

    func testIf_charactersTitle_exists() throws {
        app.launch()

        let title = app.staticTexts["Personagens"]
        XCTAssertTrue(title.exists)
    }
    
    func testIf_filterButton_exists() throws {
        app.launch()
        
        let title = app.buttons["Filtro"]
        XCTAssertTrue(title.exists)
    }
    
    func testIf_collectionItem_opens_detailsScreen() throws {
        app.launch()
        
        let collectionViewLoadedExpectation = expectation(description: "CollectionView Loaded")
        let newScreenExpectation = expectation(description: "NewScreen Loaded")
            
        let expecCollectionData = XCTWaiter.wait(for: [collectionViewLoadedExpectation], timeout: 3.0)
        
        if expecCollectionData == .timedOut {
            let collectionViewCell = app.collectionViews.cells["collectionViewCell"].firstMatch
                
            collectionViewCell.tap()
            
            let expecOpenScreen = XCTWaiter.wait(for: [newScreenExpectation], timeout: 2.0)
            
            if expecOpenScreen == .timedOut {
                let newScreenElement = app.otherElements["detailsHeader"]
                XCTAssertTrue(newScreenElement.exists)
            }
        }
    }

}
