//
//  ServiceMessageComponent.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 13/08/23.
//

import Foundation
import UIKit

class ServiceMessageComponent: UICollectionReusableView, ViewCode {
    
    lazy var messageLabel : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.textColor = .primaryColor
        lbl.font = .systemFont(ofSize: 12)
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.addSubview(messageLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            messageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            messageLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
