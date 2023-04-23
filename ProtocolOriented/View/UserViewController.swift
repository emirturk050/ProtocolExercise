//
//  ViewController.swift
//  ProtocolOriented
//
//  Created by Emir Türk on 14.04.2023.
//

import UIKit

class UserViewController: UIViewController ,UserViewModelOutput {
    
    func updateView(name: String, email: String, userName: String) {
        self.nameLabel.text = name
        self.emailLabel.text = email
        self.usernameLabel.text = userName
    }
    
    
    private let viewModel : UserViewModel
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let usernameLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.output = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        viewModel.fetchUsers()
        
    }
    
    private func setupViews() {
        
        view.backgroundColor = .cyan
        view.addSubview(nameLabel)
        view.addSubview(usernameLabel)
        view.addSubview(emailLabel)
        
        
        NSLayoutConstraint.activate(
            [
                nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                nameLabel.heightAnchor.constraint(equalToConstant: 60),
                nameLabel.widthAnchor.constraint(equalToConstant: 170),
                nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
                
                usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                usernameLabel.heightAnchor.constraint(equalToConstant: 60),
                usernameLabel.widthAnchor.constraint(equalToConstant: 170),
                usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
                
                emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                emailLabel.heightAnchor.constraint(equalToConstant: 60),
                emailLabel.widthAnchor.constraint(equalToConstant: 170),
                emailLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 10),
                
                
                
            ]
        )
        nameLabel.text = "name label"
        usernameLabel.text = "username label"
        emailLabel.text = "email label"
    }
    
   
    
}
