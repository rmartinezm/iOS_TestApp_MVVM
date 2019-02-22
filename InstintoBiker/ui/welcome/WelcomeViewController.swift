//
//  WelcomeViewController.swift
//  InstintoBiker
//
//  Created by Roberto Martínez Medina on 20/02/19.
//  Copyright © 2019 Instinto Biker. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func navigateToSignUp() {
        let signUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    @IBAction func navigateToLogIn() {
        let logInViewController = self.storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
        self.navigationController?.pushViewController(logInViewController, animated: true)
    }
    
}
