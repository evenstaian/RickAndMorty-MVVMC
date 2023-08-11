//
//  CharacterDetailsViewController.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 11/08/23.
//

import UIKit

class CharacterDetailsViewController: UIViewController, ViewCode {

    private let viewModel : CharacterDetailsViewModel
    private let coordinator: CharacterDetailsCoordinator
    
    lazy var pageName : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Character Details"
        lbl.textColor = .white
        return lbl
    }()

    init(viewModel: CharacterDetailsViewModel, coordinator: CharacterDetailsCoordinator){
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.coordinator.controller = self
        self.view.backgroundColor = .black
        setupView()
        setupConstraints()
    }
    
    func setupView() {
        self.view.addSubview(pageName)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            pageName.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            pageName.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
}
