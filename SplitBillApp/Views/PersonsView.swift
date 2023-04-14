//
//  PersonsView.swift
//  SplitBillApp
//
//  Created by Мой Macbook on 06.04.2023.
//

import UIKit

class PersonsView: UIView {

    private let personsLabel: UILabel = {
       let label = UILabel()
        label.text = "Persons"
        label.textColor = #colorLiteral(red: 0.2454499006, green: 0.2894837558, blue: 0.3496103287, alpha: 1)
        label.font = UIFont(name: "Avenir Next", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9561659694, green: 0.9591339231, blue: 0.9530903697, alpha: 1)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("-", for: .normal)
        button.tintColor = #colorLiteral(red: 0.4510066509, green: 0.4966486692, blue: 0.5633206367, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 80)
        button.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.tintColor = #colorLiteral(red: 0.4510066509, green: 0.4966486692, blue: 0.5633206367, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 60)
        button.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let counterLabel: UILabel = {
       let label = UILabel()
        label.text = "0"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir Next Bold", size: 48)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var counter = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        setupViews()
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(personsLabel)
        addSubview(backView)
        backView.addSubview(minusButton)
        backView.addSubview(plusButton)
        backView.addSubview(counterLabel)

    }

    @objc private func minusButtonTapped() {
        counter -= 1
        counterLabel.text = "\(counter)"
        
        if counter == 0 {
            minusButton.isEnabled = false
        }
    }
    
    @objc private func plusButtonTapped() {
        counter += 1
        counterLabel.text = "\(counter)"
        minusButton.isEnabled = true
    }
}

extension PersonsView {
    
   private func setConstraints() {
        NSLayoutConstraint.activate([
            personsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            personsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            backView.topAnchor.constraint(equalTo: personsLabel.bottomAnchor, constant: 2),
            backView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backView.heightAnchor.constraint(equalToConstant: 80),
            
            minusButton.topAnchor.constraint(equalTo: backView.topAnchor, constant: 0),
            minusButton.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 0),
            minusButton.widthAnchor.constraint(equalToConstant: 60),
            minusButton.heightAnchor.constraint(equalTo: backView.heightAnchor),
            
            plusButton.topAnchor.constraint(equalTo: backView.topAnchor, constant: 0),
            plusButton.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: 0),
            plusButton.widthAnchor.constraint(equalToConstant: 60),
            plusButton.heightAnchor.constraint(equalTo: backView.heightAnchor),
            
            counterLabel.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            counterLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor, constant: 10),
            counterLabel.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor, constant: -10)
        ])
    }
}
