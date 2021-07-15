//
//  ViewController.swift
//  PropertyWrappers
//
//  Created by Jade Silveira on 15/07/21.
//

import UIKit

class ViewController: UIViewController {
    @CapitalizedLabel private var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "claudia"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    @DateFormattedLabel private var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "1995-08-08"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var errorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var emptyView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewModel = ViewModel(name: "jade", date: "1995-08-08", datePicker: DateFormatted(dateString: "15/07/2021"))
        print(viewModel.name)
        print(viewModel.date)
        print(viewModel.datePicker)
        
        setupViewConfiguration()
        setupViewHierarchy()
        setupConstraints()
    }
    
    func setupViewConfiguration() {
        view.backgroundColor = .white
    }

    func setupViewHierarchy() {
        view.addSubview(nameLabel)
        view.addSubview(dateLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

