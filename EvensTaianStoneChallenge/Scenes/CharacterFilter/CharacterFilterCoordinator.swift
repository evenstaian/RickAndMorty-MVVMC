//
//  CharacterFilterCoordinator.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 12/08/23.
//

import Foundation
import UIKit

protocol CharacterFilterCoordinating : AnyObject {
    var controller : UIViewController? { get set }
    
    func returnToList()
}

class CharacterFilterCoordinator: CharacterFilterCoordinating {
    weak var controller : UIViewController?
    
    func returnToList(){
        controller?.navigationController?.popViewController(animated: true)
    }
}
