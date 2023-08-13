//
//  FilterContent.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 12/08/23.
//

import Foundation
import UIKit

class FilterContentComponent : UIView, ViewCode {
    
    lazy var filterContent : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var characterNameTitle : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .systemFont(ofSize: 18)
        lbl.textColor = .white
        lbl.text = "Procure seu \npersonagem favorito"
        lbl.numberOfLines = 2
        return lbl
    }()
    
    lazy var nameInput : UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.font = .systemFont(ofSize: 25)
        tf.textColor = .backgroundColor
        tf.tintColor = .backgroundColor
        return tf
    }()
    
    lazy var inputBorder : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var characterStatusTitle : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .systemFont(ofSize: 18)
        lbl.textColor = .white
        lbl.text = "Como está a saúde dele?"
        lbl.numberOfLines = 2
        return lbl
    }()
    
    lazy var filterBtn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Procurar", for: .normal)
        btn.setTitleColor(.primaryColor, for: .normal)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 15
        return btn
    }()
    
    // MARK: Inits Methods
    init() {
        super.init(frame: .zero)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.addSubview(filterContent)
        filterContent.addSubview(characterNameTitle)
        filterContent.addSubview(nameInput)
        filterContent.addSubview(inputBorder)
        filterContent.addSubview(characterStatusTitle)
        filterContent.addSubview(filterBtn)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            filterContent.topAnchor.constraint(equalTo: self.topAnchor),
            filterContent.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            filterContent.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            filterContent.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            characterNameTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            characterNameTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            
            nameInput.topAnchor.constraint(equalTo: self.characterNameTitle.bottomAnchor, constant: 20),
            nameInput.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            nameInput.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            nameInput.heightAnchor.constraint(equalToConstant: 20),
            
            inputBorder.topAnchor.constraint(equalTo: self.nameInput.bottomAnchor, constant: 20),
            inputBorder.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            inputBorder.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            inputBorder.heightAnchor.constraint(equalToConstant: 1),
            
            characterStatusTitle.topAnchor.constraint(equalTo: self.nameInput.bottomAnchor, constant: 40),
            characterStatusTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            characterStatusTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            
            filterBtn.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            filterBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            filterBtn.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
            filterBtn.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
