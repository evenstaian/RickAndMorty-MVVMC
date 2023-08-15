//
//  CharactersViewModelTests.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 11/08/23.
//

import XCTest
@testable import EvensTaianStoneChallenge

class CharactersViewModelTests: XCTestCase {

    lazy var sut : CharactersViewModel  = {
        let viewModel = CharactersViewModel(service: service, coordinator: coordinator)
        viewModel.delegate = delegate
        return viewModel
    }()
    
    let coordinator = CharactersCoordinatorSpy()
    let service = CharactersServiceSpy()
    let delegate = CharactersViewModelDelegateSpy()
    
    func testSetupFilterCase_shouldChangeIsFilterFlag() throws {
        sut.setupFilterCase(isFilter: true)
        
        let mirrorViewModel = Mirror(reflecting: sut.self)
        let isFilter = try XCTUnwrap(mirrorViewModel.children.first {
            $0.label == "isFilter"
        }?.value as? Bool)
        
        XCTAssertTrue(isFilter)
    }
    
    func testGetCharactersData_shouldCallServiceGetCharacters(){
        sut.getCharactersData()
        XCTAssertTrue(service.didCalledGetCharacters)
    }
    
    func testGetCharactersDataWithFilter_shouldSetupCharacterNameAndStatus() throws {
        let nameMock = "Rick"
        let statusMock = "alive"
        
        sut.setupFilterCase(isFilter: true)
        sut.getCharactersData(paginate: false, name: nameMock, status: statusMock)
        
        let mirrorViewModel = Mirror(reflecting: sut.self)
        let characterName = try XCTUnwrap(mirrorViewModel.children.first {
            $0.label == "characterName"
        }?.value as? String)
        let characterStatus = try XCTUnwrap(mirrorViewModel.children.first {
            $0.label == "characterStatus"
        }?.value as? String)
        
        XCTAssertEqual(characterName, nameMock)
        XCTAssertEqual(characterStatus, statusMock)
        
    }
    
    func testGoToDetails_shouldCallCoordinatorGoToDetails(){
        let characters = Characters(id: 10, name: "", status: "", species: "", gender: "", image: "", origin: CharacterLocation(name: "", url: ""), location: CharacterLocation(name: "", url: ""))
        sut.goToDetails(character: characters)
        XCTAssertTrue(coordinator.didCallGoToDetails)
        XCTAssertEqual(characters, coordinator.charactersSpy)
    }
    
    func testGoToFilter_shouldCallCoordinatorGoToFilter(){
        sut.goToFilter()
        XCTAssertTrue(coordinator.didCallGoToFilter)
        XCTAssertEqual(coordinator.listDelegateSpy as? CharactersViewModelDelegateSpy, sut.delegate)
    }
    
}

class CharactersServiceSpy : CharactersServicing {
    
    private(set) var didCalledGetCharacters = false
    
    func getCharacters(page: String?, name: String?, status: String?, completion: @escaping (Result<[Characters], Error>) -> Void) {
        didCalledGetCharacters = true
    }
}

class CharactersCoordinatorSpy : CharactersCoordinating {
    var controller: UIViewController?
    
    private(set) var didCallGoToDetails = false
    private(set) var didCallGoToFilter = false
    
    private(set) var charactersSpy : Characters?
    private(set) var listDelegateSpy: CharactersViewModelDelegate?
    
    func goToDetails(character: Characters) {
        didCallGoToDetails = true
        charactersSpy = character
    }
    
    func goToFilter(listDelegate: CharactersViewModelDelegate?) {
        listDelegateSpy = listDelegate
        didCallGoToFilter = true
    }
}

class CharactersViewModelDelegateSpy : NSObject, CharactersViewModelDelegate {
    private(set) var didCalledShowProgress = false
    private(set) var didCalledUpdateFooterMessage = false
    private(set) var didCalledUpdateCharacterData = false
    private(set) var didCalledSearchCharacter = false
    private(set) var charactersSpy: [Characters] = []
    private(set) var nameSpy : String = ""
    private(set) var statusSpy : String?
    
    static func == (lhs: CharactersViewModelDelegateSpy, rhs: CharactersViewModelDelegateSpy) -> Bool {
        return lhs.charactersSpy == rhs.charactersSpy
    }
    
    func showProgress() {
        didCalledShowProgress = true
    }
    func updateFooterMessage(message: String) {
        didCalledUpdateFooterMessage = true
    }
    func updateCharacterData(characters: [Characters]) {
        didCalledUpdateCharacterData = true
        charactersSpy = characters
    }
    func searchCharacter(name: String, status: String?) {
        didCalledSearchCharacter = true
        nameSpy = name
        statusSpy = status
    }
}
