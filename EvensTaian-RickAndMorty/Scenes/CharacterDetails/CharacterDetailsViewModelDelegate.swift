//
//  CharacterDetailsViewModelDelegate.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 14/08/23.
//

import Foundation
import UIKit

protocol CharacterDetailsViewModelDelegate : NSObject {
    func updateData(image: UIImage?, character: Characters)
}
