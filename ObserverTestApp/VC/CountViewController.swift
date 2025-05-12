//
//  CountViewController.swift
//  ObserverTestApp
//
//  Created by Павел Широкий on 29.04.2025.
//

import UIKit

class CountViewController: UIViewController, TapCountObserver {

    var label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .lightGray
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        let width: CGFloat = 200
        let height: CGFloat = 50
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        
    }
    
    func tapCountUpdate(_ count: Int) {
        label.text = "колличество нажатий: \(count)"
    }

}
