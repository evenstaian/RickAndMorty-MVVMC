//
//  MainInfoComponent.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 14/08/23.
//

import Foundation
import UIKit

class MainInfoComponent : UIView, ViewCode {
    
    lazy var nameLabel : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .primaryColor
        lbl.font = .systemFont(ofSize: 18)
        lbl.textAlignment = .center
        return lbl
    }()
    
    lazy var specieLabel : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .primaryColor
        lbl.font = .systemFont(ofSize: 14)
        lbl.textAlignment = .center
        return lbl
    }()
    
    lazy var statusLabel : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .primaryColor
        lbl.font = .systemFont(ofSize: 12)
        lbl.textAlignment = .center
        return lbl
    }()
    
    init(){
        super.init(frame: .zero)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(nameLabel)
        addSubview(specieLabel)
        addSubview(statusLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            specieLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            specieLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            specieLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            statusLabel.topAnchor.constraint(equalTo: specieLabel.bottomAnchor),
            statusLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            statusLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    
}
