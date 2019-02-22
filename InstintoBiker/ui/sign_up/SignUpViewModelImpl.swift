//
//  SignUpViewModel.swift
//  InstintoBiker
//
//  Created by Roberto Martínez Medina on 10/02/19.
//  Copyright © 2019 Instinto Biker. All rights reserved.
//

import Foundation
import RxCocoa

class SignUpViewModelImpl : SignUpViewModel {
    
    private var router: SignUpRouter? = nil
    private var interactor: SignUpInteractor? = nil
    
    let loading = BehaviorRelay<Bool>(value: false)
    let message = BehaviorRelay<String?>(value: nil)
    
    init(router: SignUpRouter, interactor: SignUpInteractor) {
        self.router = router
        self.interactor = interactor
    }
    
    /* */
    func signUp(email: String, password: String){
        loading.accept(true)
        interactor!.signUpWithEmailAndPassword(email: email, password: password) { error in
            self.loading.accept(false)
            if(error == nil){
                self.router?.navigateToMain()
            } else {
                self.message.accept(error!)
            }
        }
    }
    
}

