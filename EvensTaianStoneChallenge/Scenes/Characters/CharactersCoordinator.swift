//
//  CharactersCoordinator.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 10/08/23.
//

import Foundation
import UIKit

class CharactersCoordinator {
    weak var controller: UIViewController?
    
    func goToDetails() {
        let characterDetailsViewController = CharacterDetailsFactory.makeModule()
        self.controller?.navigationController?.pushViewController(characterDetailsViewController, animated: true)
    }
}
