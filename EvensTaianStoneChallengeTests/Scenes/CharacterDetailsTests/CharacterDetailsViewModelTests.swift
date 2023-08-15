//
//  CharacterDetailsViewModelTests.swift
//  EvensTaianStoneChallengeTests
//
//  Created by Evens Taian on 15/08/23.
//

import XCTest
@testable import EvensTaianStoneChallenge

class CharacterDetailsViewModelTests: XCTestCase {
    lazy var sut : CharacterDetailsViewModel  = {
        let viewModel = CharacterDetailsViewModel(service: service, character: mockCharacter())
        viewModel.delegate = delegate
        return viewModel
    }()
    
    let service = CharacterDetailsServiceSpy()
    let delegate = CharacterDetailsViewModelDelegateSpy()
    let imageUrl = "mockImage"
    
    private func mockCharacter() -> Characters {
        return Characters(id: 10, name: "", status: "", species: "", gender: "", image: imageUrl, origin: CharacterLocation(name: "", url: ""), location: CharacterLocation(name: "", url: ""))
    }

    func testSetupDetailsInfos_shouldCallDelegateUpdateData() {
        let expec = expectation(description: "wait for getImage")
        
        sut.setupDetailsInfos()
        
        delegate.expectedCompletion = {
            expec.fulfill()
            XCTAssertTrue(self.delegate.didCallUpdateData)
        }
        
        service.fullfillCompletion()
        
        self.waitForExpectations(timeout: 10, handler: nil)
    }
}

class CharacterDetailsServiceSpy : CharacterDetailsServicing {
    var expectedCompletion : ((UIImage?) -> Void)?
    var expectedImage : UIImage?
    
    func getImage(for url: URL, completion: @escaping (UIImage?) -> Void) {
        expectedCompletion = { image in
            completion(image)
        }
    }
    
    func fullfillCompletion(){
        expectedCompletion?(expectedImage)
    }
}

class CharacterDetailsViewModelDelegateSpy : NSObject, CharacterDetailsViewModelDelegate {
    private(set) var didCallUpdateData = false
    var expectedCompletion : (() -> Void)?
    
    func updateData(image: UIImage?, character: Characters) {
        didCallUpdateData = true
        fullFillCompletion()
    }
    
    func fullFillCompletion(){
        expectedCompletion?()
    }
}
