//
//  ViewController.swift
//  ObserverTestApp
//
//  Created by Павел Широкий on 29.04.2025.
//

import UIKit

class ViewController: UIViewController {

    var tapCount = 0
    weak var observer: TapCountObserver?
    
    var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Счетчик нажатий", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    var goButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Go ahead", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        goButton.addTarget(self, action: #selector(goAhead), for: .touchUpInside)
        button.addTarget(self, action: #selector(tapCountPressed), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        goButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        view.addSubview(goButton)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]);
        NSLayoutConstraint.activate([
            goButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goButton.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 15)
        ])
    }
    
    @objc
    func goAhead() {
        let secondVC = CountViewController()
        observer = secondVC as? TapCountObserver
        observer?.tapCountUpdate(tapCount)
        present(secondVC, animated: true)
        tapCount = 0
    }
    
    @objc
    func tapCountPressed() {
        tapCount += 1
        
        UserDefaults.standard.set(tapCount, forKey: "tapCount")
    }

}


protocol TapCountObserver: AnyObject {
    func tapCountUpdate(_ count: Int)
}

