//
//  LoginContract.swift
//  InstintoBiker
//
//  Created by Roberto Martínez Medina on 20/02/19.
//  Copyright © 2019 Instinto Biker. All rights reserved.
//

import Foundation

protocol LogInRouter {
    
    func navigateToMain()
    
}

protocol LogInViewModel {
    
    func logIn(email: String, password: String)
    
}

protocol LogInInteractor {
    
    func logInWithEmailAndPassword(email: String, password: String, callback: @escaping (_ error: String?) -> Void)
    
}
