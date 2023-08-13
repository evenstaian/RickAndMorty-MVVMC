//
//  OrientationManager.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 12/08/23.
//

import UIKit

extension UIViewController {
    public func updateConstraintsWithOrientation(_ portraitConstraints:[NSLayoutConstraint], _ landscapeConstraints:[NSLayoutConstraint]) {
        var orientation : UIInterfaceOrientation = UIInterfaceOrientation.portrait
        
        if UIDevice.current.orientation.isLandscape {
            orientation = .landscapeLeft
        }
        
        if orientation.isLandscape {
                NSLayoutConstraint.deactivate(portraitConstraints)
                NSLayoutConstraint.activate(landscapeConstraints)
                self.view.layoutIfNeeded()
            self.updateViewConstraints()
            } else {
                NSLayoutConstraint.deactivate(landscapeConstraints)
                NSLayoutConstraint.activate(portraitConstraints)
                self.updateViewConstraints()
                self.view.layoutIfNeeded()
            }
        }
}
