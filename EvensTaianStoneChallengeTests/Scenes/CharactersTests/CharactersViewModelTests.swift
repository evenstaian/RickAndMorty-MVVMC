//
//  CharactersViewModelTests.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 11/08/23.
//

import XCTest
@testable import EvensTaianStoneChallenge

class CharactersViewModelTests: XCTestCase {

    let coordinator = CharactersCoordinatorSpy()
    lazy var sut : CharactersViewModel  = {
        let viewModel = CharactersViewModel(coordinator: coordinator)
        return viewModel
    }()
    
    func testGoToDetails_shouldCallCoordinatorGoToDetails(){
        sut.goToDetails()
        XCTAssertTrue(coordinator.didCallGoToDetails)
    }
    
}

class CharactersCoordinatorSpy : CharactersCoordinating {
    var controller: UIViewController?
    
    private(set) var didCallGoToDetails = false
    
    func goToDetails() {
        didCallGoToDetails = true
    }
}
