//
//  CharacterDetailsFactory.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 11/08/23.
//

import Foundation
import UIKit

enum CharacterDetailsFactory {
    static func makeModule() -> UIViewController {
        let coordinator = CharacterDetailsCoordinator()
        let viewModel = CharacterDetailsViewModel()
        let controller = CharacterDetailsViewController(viewModel: viewModel, coordinator: coordinator)
        
        return controller
    }
}
