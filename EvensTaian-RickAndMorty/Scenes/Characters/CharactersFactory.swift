//
//  CharactersFactory.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 10/08/23.
//

import Foundation
import UIKit

enum CharactersFactory {
    static func makeModule() -> UIViewController {
        let coordinator = CharactersCoordinator()
        let service = CharactersService()
        let viewModel = CharactersViewModel(service: service, coordinator: coordinator)
        let controller = CharactersViewController(viewModel: viewModel)
        
        return controller
    }
}
