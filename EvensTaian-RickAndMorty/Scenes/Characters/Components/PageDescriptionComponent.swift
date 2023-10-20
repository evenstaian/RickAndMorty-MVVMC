//
//  PageDescriptionContent.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 11/08/23.
//

import Foundation
import UIKit

class PageDescriptionComponent : UIView, ViewCode {
    
    let kTitleFontSize : CGFloat = 18
    
    lazy var titleLabel : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Personagens"
        lbl.font = .systemFont(ofSize: kTitleFontSize)
        lbl.textColor = .primaryColor
        return lbl
    }()
    
    lazy var filterBtn : UIButton = {
        let btn = UIButton()
        let image = UIImage(named: "ic_filter")
        image?.withTintColor(.primaryColor, renderingMode: .automatic)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(image, for: .normal)
        btn.accessibilityIdentifier = "Filtro"
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
        addSubview(titleLabel)
        addSubview(filterBtn)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            filterBtn.topAnchor.constraint(equalTo: self.topAnchor),
            filterBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            filterBtn.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
}
