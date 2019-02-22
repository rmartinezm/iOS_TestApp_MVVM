//
//  MainViewController.swift
//  InstintoBiker
//
//  Created by Roberto Martínez Medina on 10/02/19.
//  Copyright © 2019 Instinto Biker. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onLogOutClickListener() {
        FirebaseAuthImpl().signOut { error in
            navigateTo(controllerIdentifier: "WelcomeViewController")
        }
    }
}
