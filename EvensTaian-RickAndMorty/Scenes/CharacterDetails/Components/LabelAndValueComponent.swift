//
//  LabelAndValueComponent.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 14/08/23.
//

import Foundation
import UIKit

class LabelAndValueComponent: UIView, ViewCode {
    
    lazy var label : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .primaryColor
        lbl.font = .systemFont(ofSize: 14)
        return lbl
    }()
    
    lazy var value : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .unknownColor
        lbl.font = .systemFont(ofSize: 12)
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
        addSubview(label)
        addSubview(value)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            value.topAnchor.constraint(equalTo: label.bottomAnchor),
            value.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            value.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            value.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    
}
