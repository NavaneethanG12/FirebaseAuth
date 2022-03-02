//
//  EntryViewController.swift
//  FireAuth
//
//  Created by navaneeth-pt4855 on 01/03/22.
//

import UIKit

class EntryViewController: UIViewController {

    
    let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 25
        button.backgroundColor = .link
        return button
    }()
    
    let logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 25
        button.backgroundColor = .link
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        logInButton.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
    }
    
    @objc func registerButtonTapped(_ sender: UIButton){
        
        let vc = SignUpViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func logInButtonTapped(_ sender: UIButton){
        let vc = SignInViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewWillLayoutSubviews() {
        view.addSubview(registerButton)
        view.addSubview(logInButton)
        
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            registerButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            registerButton.heightAnchor.constraint(equalToConstant: 52),
            registerButton.bottomAnchor.constraint(equalTo: logInButton.topAnchor, constant: -20),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            logInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            logInButton.heightAnchor.constraint(equalToConstant: 52),
            logInButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            logInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ])
        
    }
    


}
