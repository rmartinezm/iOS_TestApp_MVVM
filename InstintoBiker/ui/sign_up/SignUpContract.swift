//
//  SignUpContract.swift
//  InstintoBiker
//
//  Created by Roberto Martínez Medina on 11/02/19.
//  Copyright © 2019 Instinto Biker. All rights reserved.
//

import Foundation

protocol SignUpRouter {
    
    func navigateToMain()
    
}

protocol SignUpViewModel {
    
    func signUp(email: String, password: String)
    
}

protocol SignUpInteractor {
    
    func signUpWithEmailAndPassword(email: String, password: String, callback: @escaping (_ error: String?) -> Void)

}
