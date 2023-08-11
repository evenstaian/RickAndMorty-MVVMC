//
//  CharactersViewController.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 10/08/23.
//

import UIKit

class CharactersViewController: UIViewController, ViewCode {
    
    private let viewModel : CharactersViewModel
    private let coordinator: CharactersCoordinator
    
    lazy var detailsButton : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Go to details page", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(goToDetails), for: .touchUpInside)
        return btn
    }()

    init(viewModel: CharactersViewModel, coordinator: CharactersCoordinator){
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
        self.view.backgroundColor = .cyan
        setupView()
        setupConstraints()
    }
    
    @objc
    func goToDetails() {
        coordinator.goToDetails()
    }
    
    func setupView() {
        self.view.addSubview(detailsButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            detailsButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            detailsButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }

}
