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
    let service = ServiceDummy()
    lazy var sut : CharactersViewModel  = {
        let viewModel = CharactersViewModel(service: service, coordinator: coordinator)
        return viewModel
    }()
    
    func testGoToDetails_shouldCallCoordinatorGoToDetails(){
        let characters = Characters(id: 10, name: "", status: "", species: "", gender: "", image: "", origin: CharacterLocation(name: "", url: ""), location: CharacterLocation(name: "", url: ""))
        sut.goToDetails(character: characters)
        XCTAssertTrue(coordinator.didCallGoToDetails)
    }
    
    func testGoToFilter_shouldCallCoordinatorGoToFilter(){
        sut.goToFilter()
        XCTAssertTrue(coordinator.didCallGoToFilter)
    }
    
}

class CharactersCoordinatorSpy : CharactersCoordinating {
    var controller: UIViewController?
    
    private(set) var didCallGoToDetails = false
    private(set) var didCallGoToFilter = false
    
    func goToDetails(character: Characters) {
        didCallGoToDetails = true
    }
    
    func goToFilter(listDelegate: CharactersViewModelDelegate?) {
        didCallGoToFilter = true
    }
}

class ServiceDummy : CharactersServicing {
    func getCharacters(page: String?, name: String?, status: String?, completion: @escaping (Result<[Characters], Error>) -> Void) {}
}
