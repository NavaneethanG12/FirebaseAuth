//
//  ViewController.swift
//  FirebaseAuth
//
//  Created by navaneeth-pt4855 on 01/03/22.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import AVKit



class ViewController: UIViewController{
    
    let label = UILabel()
    
    var videoPLayer: AVPlayer?
    
    var viedeoPlayerLayer: AVPlayerLayer?
    
    let database = Database.database().reference()
    
    var fetchedData: [String:String]?
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Signout", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .link
        return button
    }()
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        
        
        label.text = "Welcome"
        label.textAlignment = .center
        label.textColor = .black
        view.addSubview(label)
        view.addSubview(registerButton)
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.heightAnchor.constraint(equalToConstant: 52),
            label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75)
        ])
        
        NSLayoutConstraint.activate([
            registerButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            registerButton.heightAnchor.constraint(equalToConstant: 52),
            registerButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ])
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //get the path to the bundle
        
        //make a URL from the path
        
        //create a AVPlayer Item
        
        //create a AVPlayer
        
        //create a AVPlayer Layer
        
        //play the video
      
        if let userId = SignUpViewController.signUpUserId {
            database.child(userId).observeSingleEvent(of: .value) { snapshot in
                self.fetchedData = (snapshot.value as! [String:String])
            }
        }
        
        if let userId = SignInViewController.signInUserId {
            database.child(userId).observeSingleEvent(of: .value) { snapshot in
                self.fetchedData = (snapshot.value as! [String:String])
            }
        }
        
//        label.text = "Welcome \(fetchedData!["firstName"]!)  \(fetchedData!["lastName"]!)"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        registerButton.addTarget(self, action: #selector(signOutPressed), for: .touchUpInside)
    }
    
    @objc func signOutPressed(){
        let vc = EntryViewController()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        UserDefaults.standard.setValue(0, forKey: "userlogin")
        print("Signned out")
        present(nav, animated: true, completion: nil)
        
    }
}

