//
//  SplashContract.swift
//  InstintoBiker
//
//  Created by Roberto Martínez Medina on 20/02/19.
//  Copyright © 2019 Instinto Biker. All rights reserved.
//

import Foundation

protocol SplashRouter {
    
    func navigateToWelcome()
    func navigateToMain()
    
}

protocol SplashViewModel {
    
    func verifyCurrentUser()
    
}

protocol SplashInteractor {
    
    func loadCurrentUser(callback: @escaping (_ error: String?) -> Void)
    
}
