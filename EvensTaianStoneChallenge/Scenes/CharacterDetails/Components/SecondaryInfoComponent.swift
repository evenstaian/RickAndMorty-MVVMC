//
//  SecondaryInfoComponent.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 14/08/23.
//

import Foundation
import UIKit

class SecondaryInfoComponent: UIView, ViewCode {
    
    lazy var scrollView : UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    lazy var genderComponent = LabelAndValueComponent()
    lazy var originComponent = LabelAndValueComponent()
    lazy var lastLocComponent = LabelAndValueComponent()
    
    lazy var stackView : UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.spacing = 10
        return sv
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
        addSubview(scrollView)
        genderComponent.label.text = "Gênero"
        originComponent.label.text = "Origem"
        lastLocComponent.label.text = "Ultima Localização"
        stackView.addArrangedSubview(genderComponent)
        stackView.addArrangedSubview(originComponent)
        stackView.addArrangedSubview(lastLocComponent)
        addSubview(stackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
        ])
    }
}
