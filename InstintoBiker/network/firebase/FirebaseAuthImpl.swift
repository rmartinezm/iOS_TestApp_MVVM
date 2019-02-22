//
//  AuthInteractor.swift
//  InstintoBiker
//
//  Created by Roberto Martínez Medina on 11/02/19.
//  Copyright © 2019 Instinto Biker. All rights reserved.
//

import Foundation
import FirebaseAuth

class FirebaseAuthImpl: NSObject {
    
    private let firebaseAuth: Auth = Auth.auth()
    
    /*
 
     */
    func getCurrentUser(callback: (_ user: User?) -> Void) {
        callback(firebaseAuth.currentUser)
    }
    
    /* */
    func signUpUserWithEmailAndPassword(email: String, password: String, callback: @escaping (_ user: User?, _ error: String?) -> Void){
        firebaseAuth.createUser(withEmail: email, password: password) { authResult, error in
            if error == nil {
                callback(authResult?.user, nil)
            } else {
                callback(nil, error?.localizedDescription)
            }
            
        }
    }
    
    /* */
    func logInWithEmailAndPassword(email: String, password: String, callback: @escaping (_ user: User?, _ error: String?) -> Void){
        firebaseAuth.signIn(withEmail: email, password: password) { authResult, error in
            if error == nil {
                callback(authResult?.user, nil)
            } else {
                callback(nil, error?.localizedDescription)
            }
        }
    }
    
    /* */
    func signOut(callback: (_ error: String?) -> Void){
        do {
            try firebaseAuth.signOut()
            MyUser.clearUser()
            callback(nil)
        } catch let signOutError as NSError {
            callback(signOutError.description)
        }
    }
    
}
