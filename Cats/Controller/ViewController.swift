//
//  ViewController.swift
//  Cats
//
//  Created by Bia on 25/04/20.
//  Copyright © 2020 akhaten. All rights reserved.

import UIKit

class ViewController: UIViewController {
    
    private var viewModel: ControllerViewModel
    
    private lazy var listView: ListView = {
        let iconsView = ListView(viewModel: viewModel.getCatsViewModel())
        
        return iconsView
    }()
    
    init() {
        self.viewModel = ControllerViewModel()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ControllerViewModel(boundsWidth: view.bounds.width)

        setupView()
    }
}

extension ViewController: ViewCodable {
    
    func buildViewHierarchy() {
        view.addSubview(listView)
    }
    
    func setupConstraints() {
        listView.fulfillSuperview()
    }
    
    func setupAdditionalConfiguration() {
        
        view.backgroundColor = .white
        title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
