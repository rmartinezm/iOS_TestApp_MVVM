//
//  User.swift
//  InstintoBiker
//
//  Created by Roberto Martínez Medina on 10/02/19.
//  Copyright © 2019 Instinto Biker. All rights reserved.
//

import Foundation

struct MyUser {
    
    /* */
    private static var instance: MyUser? = nil
    
    /* Private Constructor */
    private init(uid: String, email: String) {
        self.uid = uid
        self.email = email
    }
    
    /* */
    var uid: String? = nil
    /* */
    var email: String? = nil
    
    /* */
    static func initializeUser(uid: String, email: String){
        MyUser.instance = MyUser(uid: uid, email: email)
    }
    
    /* */
    static func clearUser(){
        MyUser.instance = nil
    }
    
    /* */
    static func getInstance() -> MyUser? {
        return MyUser.instance
    }
    
}
