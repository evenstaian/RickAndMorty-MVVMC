//
//  CharacterFilterViewModelTests.swift
//  EvensTaianStoneChallengeTests
//
//  Created by Evens Taian on 15/08/23.
//

import XCTest
@testable import EvensTaianStoneChallenge

class CharacterFilterViewModelTests: XCTestCase {

    lazy var sut : CharacterFilterViewModel  = {
        let viewModel = CharacterFilterViewModel(coordinator: coordinator)
        viewModel.delegate = delegate
        return viewModel
    }()
    
    let delegate = CharactersViewModelDelegateSpy()
    let coordinator = CharacterFilterCoordinatorSpy()
    
    func testSetupStatus_shouldChangeCharacterStatus() throws{
        sut.setupStatus(tagStatus: 1)
        let mirrorViewModel = Mirror(reflecting: sut.self)
        let charactersStatus = try XCTUnwrap(mirrorViewModel.children.first {
            $0.label == "characterStatus"
        }?.value as? CharacterStatusType)
        
        XCTAssertNotNil(charactersStatus)
    }
    
    func testSearchCharacter_shouldCallCoordinatorReturnToList(){
        sut.searchCharacter(name: "")
        XCTAssertTrue(coordinator.didCallReturnToList)
    }
    
    func testSearchCharacter_shouldCallDelegateSearchCharacter(){
        sut.searchCharacter(name: "")
        XCTAssertTrue(delegate.didCalledSearchCharacter)
    }
}

class CharacterFilterCoordinatorSpy : NSObject, CharacterFilterCoordinating {
    var controller: UIViewController?
    private(set) var didCallReturnToList = false
    private(set) var characterNameSpy : String?
    
    func returnToList() {
        didCallReturnToList = true
    }
}
