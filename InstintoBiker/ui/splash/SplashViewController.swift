//
//  SplashViewController.swift
//  InstintoBiker
//
//  Created by Roberto Martínez Medina on 10/02/19.
//  Copyright © 2019 Instinto Biker. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController, SplashRouter {
    
    private lazy var viewModel: SplashViewModel = { return SplashViewModelImpl(router: self, interactor: SplashInteractorImpl()) }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isToolbarHidden = true
        viewModel.verifyCurrentUser()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func startSignUpController() {
        navigateTo(controllerIdentifier: "SignUpViewController")
    }
    
    func navigateToWelcome() {
        navigateTo(controllerIdentifier: "WelcomeViewController")
    }
    
    func navigateToMain() {
        navigateTo(controllerIdentifier: "MainViewController")
    }
    
    
}
