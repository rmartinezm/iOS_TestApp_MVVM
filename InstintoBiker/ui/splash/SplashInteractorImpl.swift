//
//  SplashInteractor.swift
//  InstintoBiker
//
//  Created by Roberto Martínez Medina on 10/02/19.
//  Copyright © 2019 Instinto Biker. All rights reserved.
//

import Foundation

class SplashInteractorImpl : SplashInteractor {
    
    private let firebaseAuthImpl = FirebaseAuthImpl()
    
    
    func loadCurrentUser(callback: @escaping (_ error: String?) -> Void) {
        firebaseAuthImpl.getCurrentUser { user in
            if user != nil {
                MyUser.initializeUser(uid: user!.uid, email: user!.email!)
            }
            callback(nil)
        }
    }
    
    func signUpWithEmailAndPassword(email: String, password: String, callback: @escaping (_ error: String?) -> Void) {
        firebaseAuthImpl.signUpUserWithEmailAndPassword(email: email, password: password) { user, error in
            if error == nil {
                MyUser.initializeUser(uid: (user?.uid)!, email: email)
                callback(nil)
            } else {
                callback(error)
            }
        }
    }
    
}
