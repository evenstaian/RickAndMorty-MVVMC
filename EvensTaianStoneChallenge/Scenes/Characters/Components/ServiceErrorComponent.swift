//
//  ServiceErrorComponent.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 15/08/23.
//

import Foundation
import UIKit

class ServiceErrorComponent: UIView, ViewCode {
    
    lazy var messageLabel : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.textColor = .primaryColor
        lbl.text = "Buscando personagens..."
        lbl.font = .systemFont(ofSize: 14)
        return lbl
    }()
    
    lazy var retryButton : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Tentar Novamente", for: .normal)
        btn.setTitleColor(.aliveColor, for: .normal)
        btn.titleLabel?.font  = .systemFont(ofSize: 12)
        btn.isHidden = true
        return btn
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.addSubview(messageLabel)
        self.addSubview(retryButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            retryButton.topAnchor.constraint(equalTo: self.messageLabel.bottomAnchor, constant: 10),
            retryButton.leadingAnchor.constraint(equalTo: self.messageLabel.leadingAnchor, constant: 20),
            retryButton.trailingAnchor.constraint(equalTo: self.messageLabel.trailingAnchor, constant: -20),
            retryButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
        ])
    }
}
