//
//  LoginRepository.swift
//  InstintoBiker
//
//  Created by Roberto Martínez Medina on 05/02/19.
//  Copyright © 2019 Instinto Biker. All rights reserved.
//

import Foundation
import FirebaseAuth

class LogInInteractorImpl : LogInInteractor {
    
    private let firebaseAuthImpl = FirebaseAuthImpl()
    
    func logInWithEmailAndPassword(email: String, password: String, callback: @escaping (_ error: String?) -> Void) {
        firebaseAuthImpl.logInWithEmailAndPassword(email: email, password: password) { user, error in
            if error == nil {
                MyUser.initializeUser(uid: (user?.uid)!, email: email)
                callback(nil)
            } else {
                callback(error)
            }
        }
    }
    
}
