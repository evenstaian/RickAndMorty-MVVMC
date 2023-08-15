//
//  FilterContent.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 12/08/23.
//

import Foundation
import UIKit

class FilterContentComponent : UIView, ViewCode {
    
    lazy var scrollView : UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    lazy var filterContent : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
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
    
    lazy var statusStackView : UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 10
        return sv
    }()
    
    lazy var aliveBtn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Vivo", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.setTitleColor(.primaryColor, for: .selected)
        btn.titleLabel?.font = .systemFont(ofSize: 12)
        btn.layer.cornerRadius = 15
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.white.cgColor
        btn.tag = 1
        return btn
    }()
    
    lazy var deadBtn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Morto", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.setTitleColor(.primaryColor, for: .selected)
        btn.titleLabel?.font = .systemFont(ofSize: 12)
        btn.layer.cornerRadius = 15
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.white.cgColor
        btn.tag = 2
        return btn
    }()
    
    lazy var unknownBtn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Desconhecido", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.setTitleColor(.primaryColor, for: .selected)
        btn.titleLabel?.font = .systemFont(ofSize: 12)
        btn.layer.cornerRadius = 15
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.white.cgColor
        btn.tag = 3
        return btn
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
        statusStackView.addArrangedSubview(aliveBtn)
        statusStackView.addArrangedSubview(deadBtn)
        statusStackView.addArrangedSubview(unknownBtn)
        scrollView.addSubview(filterContent)
        scrollView.addSubview(characterNameTitle)
        scrollView.addSubview(nameInput)
        scrollView.addSubview(inputBorder)
        scrollView.addSubview(characterStatusTitle)
        scrollView.addSubview(filterBtn)
        scrollView.addSubview(statusStackView)
        addSubview(scrollView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            characterNameTitle.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            characterNameTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            characterNameTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            
            nameInput.topAnchor.constraint(equalTo: self.characterNameTitle.bottomAnchor, constant: 20),
            nameInput.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            nameInput.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            nameInput.heightAnchor.constraint(equalToConstant: 30),
            
            inputBorder.topAnchor.constraint(equalTo: self.nameInput.bottomAnchor, constant: 10),
            inputBorder.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            inputBorder.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            inputBorder.heightAnchor.constraint(equalToConstant: 1),
            
            characterStatusTitle.topAnchor.constraint(equalTo: self.nameInput.bottomAnchor, constant: 40),
            characterStatusTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            characterStatusTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            
            statusStackView.topAnchor.constraint(equalTo: characterStatusTitle.bottomAnchor, constant: 25),
            statusStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            statusStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            statusStackView.heightAnchor.constraint(equalToConstant: 60),
            
            filterBtn.topAnchor.constraint(equalTo: self.statusStackView.bottomAnchor, constant: 25),
            filterBtn.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            filterBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            filterBtn.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -100),
            filterBtn.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
