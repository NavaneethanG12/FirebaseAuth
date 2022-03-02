//
//  SignInViewController.swift
//  FireAuth
//
//  Created by navaneeth-pt4855 on 01/03/22.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {

    static var signInUserId: String?
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.placeholder = "Email"
        textField.layer.borderColor = UIColor.link.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.autocorrectionType = .no
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.textAlignment = .center
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.placeholder = "Password"
        textField.layer.borderColor = UIColor.link.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.isSecureTextEntry = true
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.textAlignment = .center
        return textField
    }()
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .link
        button.layer.cornerRadius = 25
        return button
    }()
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(registerButton)

        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
            emailTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            emailTextField.heightAnchor.constraint(equalToConstant: 52),
            emailTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            passwordTextField.heightAnchor.constraint(equalToConstant: 52),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            registerButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            registerButton.heightAnchor.constraint(equalToConstant: 52),
            registerButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ])
                
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)

    }
    

    @objc func registerButtonTapped(_ sender: UIButton){
        
        if let email = emailTextField.text, let password = passwordTextField.text{
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                
                if error == nil{
                    let vc = ViewController()
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true, completion: nil)
                    UserDefaults.standard.setValue(1, forKey: "userlogin")
                    
                    SignInViewController.signInUserId = result!.user.uid
                    
                }else{
                    let alert = UIAlertController(title: "ERROR", message: error?.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alert,animated: true)
                }
            }
        }
        
    }

}
